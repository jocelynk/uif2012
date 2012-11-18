class HomeController < ApplicationController
  respond_to :html, :json, :js
  def index
   @events = Event.current
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
  #Need to Fix this later for more than one section!!!!
  #Need to check later, right now getting param from URL, good way to do this?
  #store it in session variables instead
  def checkin
    if !params[:event_id].nil?
      session[:event_id] = params[:event_id]
    end
    
    #@event_id = (params[:e_id].nil?)? params[:event_id] : params[:e_id]
    @event_id = session[:event_id]
    @event_details = Event.joins('INNER JOIN section_events AS se ON se.event_id = events.id INNER JOIN sections s ON s.id = se.section_id').where('events.id = ?', @event_id).select('s.name AS section, events.date')
    @barcode = params[:barcode]
    puts "------init------"
    @print = "your barcode is: #{@barcode}";  
    puts @print

    if (!@barcode.nil?)
       @student_id = Student.where('students.barcode_number = ?', @barcode).select('students.id')
       @attendance = Attendance.new({:student_id => @student_id.first.id, :event_id =>  @event_id})
       @attendance.save
       flash[:notice] = "asdfasdf"
       render :update do |page|
        flash[:notice] = "Barcode was successfully scanned"
         puts "+++++++++++++++++++++++++"
        puts flash[:notice]
        page.reload_flash
       end

       #respond_to do |format|
       # format.html #{ redirect_to checkin_url, notice: 'asdfasdfadsf' }
       # format.json {render json: @event_details, status: "test", location: "testtest"}
       # format.js {render json: @event_details, status: "test", location: "testtest"}
      # end
       
     else
       flash[:notice] = "qwerqewr"
       render :checkin do |page|
        flash[:notice] = "There was something wrong with the scanning!"
        puts "============================"
        puts flash[:notice]
        page.reload_flash
       end
     end
  end
end
