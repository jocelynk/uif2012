class AttendencesController < ApplicationController
  # GET /attendences
  # GET /attendences.json
  def index
    @attendences = Attendence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendences }
    end
  end

  # GET /attendences/1
  # GET /attendences/1.json
  def show
    @attendence = Attendence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendence }
    end
  end

  # GET /attendences/new
  # GET /attendences/new.json
  def new
    @attendence = Attendence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendence }
    end
  end

  # GET /attendences/1/edit
  def edit
    @attendence = Attendence.find(params[:id])
  end

  # POST /attendences
  # POST /attendences.json
  def create
    @attendence = Attendence.new(params[:attendence])

    respond_to do |format|
      if @attendence.save
        format.html { redirect_to @attendence, notice: 'Attendence was successfully created.' }
        format.json { render json: @attendence, status: :created, location: @attendence }
      else
        format.html { render action: "new" }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendences/1
  # PUT /attendences/1.json
  def update
    @attendence = Attendence.find(params[:id])

    respond_to do |format|
      if @attendence.update_attributes(params[:attendence])
        format.html { redirect_to @attendence, notice: 'Attendence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendences/1
  # DELETE /attendences/1.json
  def destroy
    @attendence = Attendence.find(params[:id])
    @attendence.destroy

    respond_to do |format|
      format.html { redirect_to attendences_url }
      format.json { head :no_content }
    end
  end
end
