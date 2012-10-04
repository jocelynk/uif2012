class StudentAllergiesController < ApplicationController
  # GET /student_allergies
  # GET /student_allergies.json
  def index
    @student_allergies = StudentAllergy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_allergies }
    end
  end

  # GET /student_allergies/1
  # GET /student_allergies/1.json
  def show
    @student_allergy = StudentAllergy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_allergy }
    end
  end

  # GET /student_allergies/new
  # GET /student_allergies/new.json
  def new
    @student_allergy = StudentAllergy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_allergy }
    end
  end

  # GET /student_allergies/1/edit
  def edit
    @student_allergy = StudentAllergy.find(params[:id])
  end

  # POST /student_allergies
  # POST /student_allergies.json
  def create
    @student_allergy = StudentAllergy.new(params[:student_allergy])

    respond_to do |format|
      if @student_allergy.save
        format.html { redirect_to @student_allergy, notice: 'Student allergy was successfully created.' }
        format.json { render json: @student_allergy, status: :created, location: @student_allergy }
      else
        format.html { render action: "new" }
        format.json { render json: @student_allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_allergies/1
  # PUT /student_allergies/1.json
  def update
    @student_allergy = StudentAllergy.find(params[:id])

    respond_to do |format|
      if @student_allergy.update_attributes(params[:student_allergy])
        format.html { redirect_to @student_allergy, notice: 'Student allergy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_allergies/1
  # DELETE /student_allergies/1.json
  def destroy
    @student_allergy = StudentAllergy.find(params[:id])
    @student_allergy.destroy

    respond_to do |format|
      format.html { redirect_to student_allergies_url }
      format.json { head :no_content }
    end
  end
end
