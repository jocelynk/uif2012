class HomeController < ApplicationController
  respond_to :html, :json, :js
  before_filter :set_controller_and_action_names
  
  def index
   @events = Event.current
   @all_events = Event.paginate(:page => params[:page], :per_page => 5)
   @past = Event.past.by_date_desc.paginate(:page => params[:page], :per_page => 5)
   
   @alerts = Note.alerts.active.by_priority.by_date_desc.last_six.all
   @alert_count = Note.alerts.active.all.length
   @upcoming = Event.upcoming.paginate(:page => params[:page], :per_page => 5)
  
  
  end 

  def about
  end

  def contact
  end

  def search
   @query = params[:query]
   @students = Student.search(@query)
   @total_hits = @students.size
  end

  def checkin
    session[:event] = params[:event_id]
    @event = Event.find(session[:event])
    if @event.program.scan_by_absence && session[session[:event].intern].nil?
      @absent_students = Event.absentees(session[:event])
      if(!@absent_students.nil?)
        @absent_students.each do |student|
          student.attendances.create(event_id: session[:event])
        end
      end    
      @attendees = Event.attendees(session[:event])
      @absentees = Event.absentees(session[:event])
      session[session[:event].intern] = 1;
    else
      @attendees = Event.attendees(session[:event])
      @absentees = Event.absentees(session[:event])
    end
    
    if !@event.program.scan_by_absence && params[:barcode] && session[:event]
      @student = Student.find_by_barcode_number(params[:barcode])
      if @student && @student.attendances.create(event_id: params[:event_id])
        if @student.is_visitor
          note = Note.new
          note.user_id = current_user.id
          note.date = Date.today
          note.contents = "#{@student.proper_name} is a new visitor attending an event for #{@event.program.name}."
          note.notable_type = "Event"
          note.notable_id = @event.id
          note.priority = 2
          note.title = "Visitor #{@student.proper_name} Attended Event"
          note.active = true
          note.save
        end
        
        @attendances = Event.attendees(session[:event])
        @absences = Event.absentees(session[:event])
        if(!@absences.nil?) 
          @absences.each do |student|
            puts student.proper_name if !student.nil?
          end
        end
        render :json => { message: "#{@student.proper_name} was successfully scanned!", attendees: @attendances, absentees: @absences }
      else
        render :json => { error:'There was an error scanning.'}
      end    
    end
    
    if @event.program.scan_by_absence && params[:barcode] && session[:event]
      @student = Student.find_by_barcode_number(params[:barcode])
      if @student
        @attendance = Attendance.find_by_student_id_and_event_id(@student.id,session[:event])
        if(!@attendance.nil?)
          if @student.attendances.destroy(@attendance.id)
            @attendees = Event.attendees(session[:event])
            @absentees = Event.absentees(session[:event])
            render :json => { message: "#{@student.proper_name} did not attend!", attendees: @attendees, absentees: @absentees }
          elsif
            render :json => { error:'There was an error scanning.', message:  "#{@student.proper_name} was not scanned. Try again."}
          end
        else  
          @attendees = Event.attendees(session[:event])
          @absentees = Event.absentees(session[:event])
          render :json => { message:"#{@student.proper_name} is already absent.",attendees: @attendees, absentees: @absentees }
        end
      else
        render :json => { error:'There was an error scanning.' }
      end    
    end
  end
  
  def statistics
    @department = Department.all
    months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    if !params[:date].nil?
      month = params[:date][:month]
      
      @w_month = months[month.to_i-1]
      year = params[:date][:year]

      @attendance_by_month_year = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int = '+month+' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name, programs.name ORDER BY department, program')
     
     @total_attendance_by_month_year =  ActiveRecord::Base.connection.execute('SELECT d.name AS department, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int = '+month+' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name ORDER BY d.name')
      
      @events_by_month_year = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (EXTRACT(MONTH from date)::int = '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.id, programs.id ORDER BY d.name, programs.name')
      
      @total_events_by_month_year = ActiveRecord::Base.connection.execute('SELECT d.name AS department, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (EXTRACT(MONTH from date)::int = '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.id ORDER BY d.name')
       
      @join = @attendance_by_month_year.zip(@events_by_month_year)
      
      @join_total = @total_attendance_by_month_year.zip(@total_events_by_month_year)
      
      #YTD statistics
      if (9..12).include?(month.to_i)
        @ytd_by_program_attendance = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int >= 9 AND EXTRACT(MONTH from date)::int <= '+month+' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name, programs.id ORDER BY d.name, programs.name')
        
        @ytd_by_program_event = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (EXTRACT(MONTH from date)::int >=9 AND EXTRACT(MONTH from date)::int <= '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.name, programs.id ORDER BY d.name, programs.name')
        
        @ytd_by_department_attendance = ActiveRecord::Base.connection.execute('SELECT d.name AS department, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int >= 9 AND EXTRACT(MONTH from date)::int <= '+month+' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name ORDER BY d.name')
        
        @ytd_by_department_event = ActiveRecord::Base.connection.execute('SELECT d.name AS department, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (EXTRACT(MONTH from date)::int >=9 AND EXTRACT(MONTH from date)::int <= '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.id ORDER BY d.name')
        
        @ytd_join = @ytd_by_program_attendance.zip(@ytd_by_program_event)
        @ytd_total_join = @ytd_by_department_attendance.zip(@ytd_by_department_event)
      elsif (1..8).include?(month.to_i)
        last_year = (year.to_i - 1).to_s
        @ytd_by_program_attendance = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int BETWEEN 9 AND 12 AND EXTRACT(YEAR from date)::int ='+last_year+') OR (EXTRACT(MONTH from date)::int BETWEEN 1 AND '+ month +' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name, programs.name ORDER BY d.name, programs.name')
        @ytd_by_program_event = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (EXTRACT(MONTH from date)::int BETWEEN 9 AND 12 AND EXTRACT(YEAR from date)::int = '+last_year+') OR (EXTRACT(MONTH from date)::int BETWEEN 1 AND '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.name, programs.name ORDER BY d.name, programs.name')
     
     
        @ytd_by_department_attendance = ActiveRecord::Base.connection.execute('SELECT d.name AS department, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (EXTRACT(MONTH from date)::int BETWEEN 9 AND 12 AND EXTRACT(YEAR from date)::int ='+last_year+') OR ((EXTRACT(MONTH from date)::int) BETWEEN 1 AND '+month+' AND EXTRACT(YEAR from date)::int ='+year+') GROUP BY d.name ORDER BY d.name')
        @ytd_by_department_event = ActiveRecord::Base.connection.execute('SELECT d.name AS department, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE ((EXTRACT(MONTH from date)::int) BETWEEN 9 AND 12 AND EXTRACT(YEAR from date)::int = '+last_year+') OR ((EXTRACT(MONTH from date)::int) BETWEEN 1 AND '+month+' AND EXTRACT(YEAR from date)::int = '+year+') GROUP BY d.id ORDER BY d.name')

 
        @ytd_join = @ytd_by_program_attendance.zip(@ytd_by_program_event)
        @ytd_total_join = @ytd_by_department_attendance.zip(@ytd_by_department_event)
     end 
      
      
      respond_to do |format|
        format.html
        format.json
        format.js
        format.pdf {prawnto filename: "Statistics", :inline => false }
      end
    else
      respond_to do |format|
        format.html
        format.json { render error: "Please search again"}
        format.js
        format.pdf {prawnto filename: "Statistics", :inline => false } 
      end
    end
  end
  
end

