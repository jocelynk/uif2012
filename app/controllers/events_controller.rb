class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :load, :set_controller_and_action_names, :check_login

  def load
    @events = Event.by_date(params[:date_query])
    #@events_months = Event.all.group_by { |t| t.date.beginning_of_month }
    @event = Event.new
  end
  
  def index
    
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
    @section_select_data = Section.all.collect{|s| [s.name, s.id]}
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
    respond_to do |format|
      if @event.update_attributes(params[:event])
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
end
