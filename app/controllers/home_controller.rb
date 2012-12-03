class HomeController < ApplicationController
  respond_to :html, :json, :js
  def index
   @events = Event.current
   @all_events = Event.paginate(:page => params[:page], :per_page => 5)
   @all_notes = Note.all
  end

  def about
  end

  def contact
  end

  #use sunspot gem for search????
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
      @month = params[:date][:month]
      
      @w_month = months[@month.to_i-1]
      @year = params[:date][:year]
     # @attendance_by_month_year = Program.joins('INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id').where('strftime("%m", date) + 0 = ? AND strftime("%Y", date) + 0 = ?',month,year).select("d.name AS department, programs.name AS program, COUNT(a.id) AS attendances").group("d.id, programs.id").order("d.name, programs.name")  
      
      @attendance_by_month_year = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, COUNT(a.id) AS attendances FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id LEFT JOIN attendances a ON a.event_id = e.id WHERE (strftime("%m", date) + 0 = '+@month+' AND strftime("%Y", date) + 0 ='+@year+') GROUP BY d.name, programs.name ORDER BY department, program')
      
      
      @events_by_month_year = ActiveRecord::Base.connection.execute('SELECT d.name AS department, programs.name AS program, SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = \'t\' THEN 1 ELSE 0 END) AS gospel FROM "programs" INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id WHERE (strftime("%m", date) + 0 = '+@month+' AND strftime("%Y", date) + 0 = '+@year+') GROUP BY d.id, programs.id ORDER BY d.name, programs.name')
      
      @join = @attendance_by_month_year.zip(@events_by_month_year)

      
      #@events_by_month_year = Program.joins('INNER JOIN departments d ON d.id = programs.department_id LEFT JOIN events e ON e.program_id = programs.id').where('strftime("%m", date) + 0 = ? AND strftime("%Y", date) + 0 = ?',12,2012).select("d.name AS department, programs.name AS program,  SUM(e.meals_served) AS meals, SUM(e.bibles_distributed) AS bibles, SUM(CASE WHEN e.gospel_shared = 't' THEN 1 ELSE 0 END) AS gospel").group("d.id, programs.id").order("d.name, programs.name")
      
      
      respond_to do |format|
        format.html
        format.json
        format.js  
      end
    else
      @error = "Please search again."
      respond_to do |format|
        format.html
        format.json { render error: "Please search again"}
        format.js  
      end
    end
  end
  
end
