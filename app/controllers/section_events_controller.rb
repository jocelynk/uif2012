class SectionEventsController < ApplicationController
  #before_filter :check_login
  # GET /section_events
  # GET /section_events.json
  before_filter :authenticate_user!
  def index
    @section_events = SectionEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @section_events }
    end
  end

  # GET /section_events/1
  # GET /section_events/1.json
  def show
    @section_event = SectionEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section_event }
    end
  end

  # GET /section_events/new
  # GET /section_events/new.json
  def new
    @section_event = SectionEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section_event }
    end
  end

  # GET /section_events/1/edit
  def edit
    @section_event = SectionEvent.find(params[:id])
  end

  # POST /section_events
  # POST /section_events.json
  def create
    @section_event = SectionEvent.new(params[:section_event])

    respond_to do |format|
      if @section_event.save
        format.html { redirect_to @section_event, notice: 'Section event was successfully created.' }
        format.json { render json: @section_event, status: :created, location: @section_event }
      else
        format.html { render action: "new" }
        format.json { render json: @section_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /section_events/1
  # PUT /section_events/1.json
  def update
    @section_event = SectionEvent.find(params[:id])

    respond_to do |format|
      if @section_event.update_attributes(params[:section_event])
        format.html { redirect_to @section_event, notice: 'Section event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_events/1
  # DELETE /section_events/1.json
  def destroy
    @section_event = SectionEvent.find(params[:id])
    @section_event.destroy

    respond_to do |format|
      format.html { redirect_to section_events_url }
      format.json { head :no_content }
    end
  end
end
