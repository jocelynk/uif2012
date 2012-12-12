class AllergiesController < ApplicationController
  # GET /allergies
  # GET /allergies.json
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  
  respond_to :html, :json, :js, :xml
  def ajax_allergies
    puts params
    @allergy = Allergy.new
    @allergy.name = params[:name]
    @allergy.warning_text = params[:warning_text]

    respond_to do |format|
      if @allergy.save
        format.html { redirect_to @allergy, notice: 'Allergy was successfully created.' }
        format.json { render json: @allergy, status: :created, location: @allergy }
      else
        format.html { render action: "new" }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
    @allergies = Allergy.paginate(:page => params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @allergies }
    end
  end

  # GET /allergies/1
  # GET /allergies/1.json
  def show
    @allergy = Allergy.find(params[:id])

    respond_with(@allergy) do |format|
      format.html # show.html.erb
      format.js { render json: @allergy, :callback => params[:callback] }
    end
  end

  # GET /allergies/new
  # GET /allergies/new.json
  def new
    @allergy = Allergy.new

    respond_with(@allergy) do |format|
      format.html # new.html.erb
      format.js { render json: @allergy, :callback => params[:callback] }
    end
  end

  # GET /allergies/1/edit
  def edit
    @allergy = Allergy.find(params[:id])
  end

  # POST /allergies
  # POST /allergies.json
  def create
    @allergy = Allergy.new(params[:allergy])
    #respond_with Allergy.create(params[:allergy])
    respond_to do |format|
      if @allergy.save
        format.html { redirect_to @allergy, notice: 'Allergy was successfully created.' }
        format.json { render json: @allergy, status: :created, location: @allergy }
      else
        format.html { render action: "new" }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /allergies/1
  # PUT /allergies/1.json
  def update
    @allergy = Allergy.find(params[:id])
    respond_to do |format|
      if @allergy.update_attributes(params[:allergy])
        format.html { redirect_to @allergy, notice: 'Allergy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergies/1
  # DELETE /allergies/1.json
  def destroy
    @allergy = Allergy.find(params[:id])
    @allergy.destroy

    respond_to do |format|
      format.html { redirect_to allergies_url }
      format.json { head :no_content }
    end
  end
end
