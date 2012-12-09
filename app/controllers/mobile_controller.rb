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
    #params[:event][:sections].shift
   # sections = params[:event][:sections]
   # event_id = params[:event][:id]
   # params[:event].delete "sections"

    
   # @event = Event.new(params[:event])
    
   respond_to do |format|
      #if @event.save
        # sections.each do |section_id|
       #    @section = SectionEvent.new({:event_id => @event.id, :section_id => section_id})            @section.save
 #        end 
           format.json {render :json=>{:message => "Message"}, :callback => params[:callback] }
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
          @attendance = Attendance.find_by_student_id_and_event_id(@student.id,event)
          if @student and !@attendance
            if @student.attendances.create(event_id: event)
              @scanned.push(@student.proper_name)         
            end
          else
            if !@attendance
              @bad_barcodes.push(barcode)
            else
              @already_scanned.push(@student.proper_name)
            end
            
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
    if Student.find_by_barcode_number(@barcode)
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
