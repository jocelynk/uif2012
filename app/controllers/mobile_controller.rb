class MobileController < ApplicationController

 #Methods for mobile
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
    
    puts barcodes[0]
    puts event
    puts '++++++++++++++++++++++++++++++++++'
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
  
  def getPhoto
    puts "====================="
    puts params
    puts params[:file]
    file_name = params[:file].original_filename
    #temp_file = "#{Rails.root}/public/uploads/uploaded.jpg"
    id = 0
    #while File.exists?(temp_file) do
    #  temp_file = "#{Rails.root}/public/uploaded-#{id}.jpg"        
   #   id += 1
    #end
    # Save to temp file
   # File.open(temp_file, 'wb') do |f|
     # f.write  request.body.read 
    #end
  
    tempfile = Tempfile.new("photoupload", 'public/uploads/tmp')
    tempfile.binmode
    tempfile << request.body.read
    tempfile.rewind

    puts "TEMP"
    puts tempfile.length()
    puts tempfile.path()
    params[:file].tempfile = tempfile
    puts "NEW PARAMS"
    puts params
    #photo_params = params.slice(:filename, :content_type, :headers, :original_filename).merge(:tempfile => tempfile)
    #puts "photo_params"
    #puts photo_params
    @photo = ActionDispatch::Http::UploadedFile.new({:filename => 'test.jpg', :content_type => 'image/jpeg', :tempfile => tempfile, :original_filename => params[:original_filename]})
    puts "PHOTO"
    puts @photo
    puts @photo.tempfile
    @student = Student.find_by_id(10)
    @student.photo = "asdfasdfasdf"
    puts @student.save
    puts @student.update_attributes(:photo => params[:file])
    if @student.update_attributes(:photo => params[:file])
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
  end
   
end
