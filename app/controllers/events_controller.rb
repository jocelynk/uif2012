class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :load, :set_controller_and_action_names, :authenticate_user!#, #:check_login

  def load
    @events = Event.by_date(params[:date_query])
    # @ev = Event.all
    #@events_months = Event.all.group_by { |t| t.date.beginning_of_month }
    @event = Event.new
  end
  
  def index
    @events = Event.paginate(:page => params[:page]).per_page(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
      format.js
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @attendees = Event.attendees(params[:id])
    @absentees = Event.absentees(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @sections = Section.joins('INNER JOIN section_events se ON se.section_id = sections.id INNER JOIN events e ON e.id = se.event_id').where('e.id = ?', @event.id).select('sections.id as section_id');
    gon.event_sections = @sections
  end

  # POST /events
  # POST /events.json
  def create

    params[:event][:sections].shift
    sections = params[:event][:sections]
    event_id = params[:event][:id]
    params[:event].delete "sections"

    
    @event = Event.new(params[:event])
    
    respond_to do |format|
       if @event.save
          sections.each do |section_id|
            @section = SectionEvent.new({:event_id => @event.id, :section_id => section_id})
            @section.save
          end 
        if request.xhr?
          flash[:notice] = "Event was successfully created."
          format.html #{ redirect_to events_url, notice: 'Event was successfully created.' }
          # format.json { render json: @event, status: :created, location: @event }
          format.js
          @events = Event.by_date(params[:date_query])
        else
          flash[:notice] = "Event was successfully created."
          format.html { redirect_to events_url, notice: 'Event was successfully created.' }
          format.json { render json: @event, status: :created, location: @event }
          format.js
        end
      else
        if request.xhr?
          format.html #{ render action: "new" }
       #  format.json { render json: @event.errors, status: :unprocessable_entity }
          format.js
        else
          format.html { render action: "new" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
          format.js
        end

    end
     # if @event.save
      #  format.html { redirect_to @event, notice: 'Event was successfully created.' }
      #  format.json { render json: @event, status: :created, location: @event }
      #  format.js
     # else
      #  format.html { render action: "new" }
      #  format.json { render json: @event.errors, status: :unprocessable_entity }
      #  format.js

    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    
    params[:event][:sections].shift
    new_sections = params[:event][:sections].to_a
    params[:event].delete "sections"
    
    old_sections = SectionEvent.where(:event_id => @event.id)
    respond_to do |format|
      if @event.update_attributes(params[:event])
        if(old_sections.length == new_sections.length)
          count1 = 0;
          old_sections.each do |section|
            @section = SectionEvent.find(section.id)
            @section.update_attributes({:event_id => @event.id, :section_id => new_sections[count1]})
            count1 += 1
          end 
        elsif (old_sections.length > new_sections.length)
          count2 = 0;
          old_sections.each do |section|
            @section = SectionEvent.find(section.id)
            if(count2 >= new_sections.length)
              @section.destroy
              count2 += 1
            else
              @section.update_attributes({:event_id => @event.id, :section_id => new_sections[count2]})
              count2 += 1
            end
          end
        else
          count3 = 0;
          old_sections.each do |section|
            @section = SectionEvent.find(section.id)
            @section.update_attributes({:event_id => @event.id, :section_id => new_sections[count3]})
            count3 += 1
          end
          while (count3 < new_sections.length)
            @section = SectionEvent.new({:event_id => @event.id, :section_id => new_sections[count3]})
            @section.save
            count3 += 1
          end
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      if request.xhr?
        format.html
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to events_url }
        format.json { head :no_content }
        format.js
      end
       
    end
  end
  
  def meals_served
    puts '++++++++++++++++++++'
    puts params[:id]
    puts '++++++++++++++++++++'
    if !params[:id].nil?
      gon.event_id = params[:id]
    end
    puts'_______________________'
    puts gon.event_id
    puts '++++++++++++++++++++'
    # session[:event] = params[:format]
    @event = Event.find(gon.event_id)
    puts @event
    puts params[:barcode]
    puts ")))))))))))))))))))"
    if params[:barcode]
      @student = Student.find_by_barcode_number(params[:barcode])
      if @student
        @meals_served = @event.meals_served
        puts @meals_served
        @new_meal = @meals_served+1
        puts @new_meal
        puts '+++++++++++++++++++++++++++++'
        @event.update_attributes({:meals_served => @new_meal})
        puts @event.update_attributes({:meals_served => @new_meal})
        render :json => { message: "Meals Served: #{@new_meal}"}
      else
        render :json => { error: 'There was something wrong with the scan!' }
      end
    end
  end
end
