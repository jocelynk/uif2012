class MobileController < ApplicationController

 #Methods for mobile
 
 #Event Methods
 
 #Create an Event
  def getProgramsAndSections
    @programs = Program.active
    @sections = Section.joins('INNER JOIN programs p ON p.id = sections.program_id').where('sections.active = ?', true).select('sections.id, sections.name as section, p.name')
    @locations = Location.all
    respond_to do |format|
      format.json {render :json=>{:programs=>@programs, :sections => @sections, :locations => @locations}, :callback => params[:callback] }
    end
  end
  
  def createEvent
    puts params
    startt = Time.parse(params[:start_time]) rescue nil
    endt = Time.parse(params[:end_time]) rescue nil
    if params[:sections].length <1
      respond_to do |format|
         format.json {render :json=>{:error => "Please select a section(s)"}, :callback => params[:callback] }
      end
    elsif params[:program].length <1
      respond_to do |format|
        format.json {render :json=>{:error => "Please select a program"}, :callback => params[:callback] } 
      end
    elsif params[:start_time].length <1 or params[:end_time].length <1 or startt.nil? or endt.nil?
      respond_to do |format|
        format.json {render :json=>{:error => "Please select a start and end time in a 24-hr HH:MM format."}, :callback => params[:callback] } 
      end 
    else
      @event = Event.new
      @event.date = Date.today
      @event.program_id = params[:program]
      @event.location_id = params[:location]
      split_start = params[:start_time].split(/[ :]/)
      puts split_start 
      if split_start[2] == 'AM' and split_start[0].to_i == 12
        hour = 24
      elsif split_start[2] == 'PM' and split_start[0].to_i == 12  
        hour = 12
      elsif split_start[2] == 'AM'
        hour = split_start[0].to_i
      else
        hour = split_start[0].to_i + 12
      end
      puts "hour"
      puts hour
      @event.start_time = Time.local(Date.today.year, Date.today.month, Date.today.day, hour, split_start[1]) rescue nil
      
      
      split_end = params[:end_time].split(/[ :]/)
      puts split_end
      puts split_end[0].to_i 
      if split_end[2] == 'AM' and split_end[0].to_i == 12
        hourend = 24
      elsif split_end[2] == 'PM' and split_end[0].to_i == 12  
        hourend = 12
      elsif split_end[2] == 'AM'
        hourend = split_end[0].to_i
      else
        hourend = split_end[0].to_i + 12
      end
       puts "end"
      puts hourend
      @event.end_time = Time.local(Date.today.year, Date.today.month, Date.today.day, hourend, split_end[1]) rescue nil

      puts @event.date
      puts @event.program_id
      puts @event.location_id
      puts "start_time and end time"
      puts @event.start_time
      puts @event.end_time
      if @event.save
        puts @event.start_time
        params[:sections].each do |section|
          @section = SectionEvent.new({:event_id => @event.id, :section_id => section})
          @section.save          
        end 
        respond_to do |format|
            format.json {render :json=>{:message => "Event was successfully created"}, :callback => params[:callback] }
        end
      else
        respond_to do |format|
            format.json {render :json=>{:error => "There was something wrong with the event"}, :callback => params[:callback] }
        end
      end
    end   
  end

  def getTodaysEvents
    @current = Event.current
    @events = Hash.new;
    @current.each do |event|
      @sections = Array.new;
      event.sections.each do |section|
        @sections.push(section.name)
      end
      @events[event.id] = {:event => event, :section=> @sections, :program => event.program.name, :location => event.location.name}
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events, :callback => params[:callback] }
      format.js
    end  
  end
  
  def createAttendances
    barcodes = params[:barcodes]
    event = params[:event_id]
    
    @scanned = Array.new
    @already_scanned = Array.new
    @bad_barcodes = Array.new

    if !barcodes.nil? && Event.find_by_id(event)
       barcodes.each do |barcode|
          @student = Student.find_by_barcode_number(barcode)
         
          if @student
             @attendance = Attendance.find_by_student_id_and_event_id(@student.id,event)
            if  !@attendance
              if @student.attendances.create(event_id: event)
                @scanned.push(@student.proper_name)         
              end
            else 
               @already_scanned.push(@student.proper_name)
            end
          else
               @bad_barcodes.push(barcode)         
          end
        end
      respond_to do |format|
        format.json { render :json=>{:scanned=>@scanned, :bad_barcodes => @bad_barcodes, :already_scanned =>  @already_scanned}, :callback => params[:callback] }
      end
    else
       respond_to do |format|

        format.json { render :json=>{:message=>"There was an error with the barcodes or event."}, :callback => params[:callback] }
      end 
       
    end
  end
  
  #Student Methods
  
  def searchForStudent
    @barcode = params[:bar_code]
    @student = Student.find_by_barcode_number(@barcode)
    puts @student.nil?
    if !@student.nil?
       respond_to do |format|

          format.json { render :json=>@student, :callback => params[:callback] }
       end
    else
       respond_to do |format|
          format.json { render :json=>{:message=>"No student was found."}, :callback => params[:callback] }
       end
    end
  end
  
  def getPhoto
    barcode = params[:barcode]
    @student = Student.find_by_barcode_number(barcode)
    
    if @student
      if @student.update_attributes(:avatar => params[:file])
        puts "success"
        
        respond_to do |format|

            format.json { render :json=>{:message=>"Picture was successfully uploaded"}, :callback => params[:callback] }
        end
      else
       respond_to do |format|
        puts"error"
          format.json { render :json=>{:error=>"There was an error with the upload"}, :callback => params[:callback] }
       end
      end
    else
       respond_to do |format|
        puts"error"
          format.json { render :json=>{:error=>"Student was not found"}, :callback => params[:callback] }
       end
    end
  end
   
end
