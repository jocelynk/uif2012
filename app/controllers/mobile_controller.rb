class MobileController < ApplicationController

 #Methods for mobile
 
 #Event Methods
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
    @bad_attendances = Array.new
    @bad_barcodes = Array.new

    if !barcodes.nil? && Event.find_by_id(event)
       barcodes.each do |barcode|
          @student = Student.find_by_barcode_number(barcode)
          if @student
            if @student.attendances.create(event_id: event)
              @scanned.push(@student.proper_name)
            else
              @bad_attendances.push(@student.proper_name) 
            end
          else
            @bad_barcodes.push(barcode)
          end
        end
      respond_to do |format|
        format.json { render :json=>{:scanned=>@scanned, :bad_barcodes => @bad_barcodes, :bad_attendances => @bad_attendances}, :callback => params[:callback] }
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
