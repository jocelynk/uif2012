class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  #before_filter :check_login
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json, :js
  def index
    # @students = Student.search(params[:query])
    # we need to figure out a way to do both
    # @query = Student.search(params[:query])
    @students = Student.alphabetical.paginate(:page => params[:page], :per_page => 15)
    @query = Student.search(params[:query])
    # @query = Student.search(params[:query]).page(params[:page]).order('last_name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @recent_activities = @student.recent_activity
    respond_with(@student) do |format|
      format.js { render json: @student, :callback => params[:callback] }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    #remove program field in params
    if !params[:student][:enrollments_attributes].nil?
      @enrollments = params[:student][:enrollments_attributes]
    end
    params[:student].delete "enrollments_attributes"
    puts @enrollments
    @student = Student.new(params[:student])
    puts @student.save
    respond_to do |format|
      if @student.save
        unless @enrollments.nil? || @enrollments.empty?
          @enrollments.each do |reg|
            @enrollment = Enrollment.new({:student_id =>@student.id, :section_id => reg.second["section_id"].to_i})
            @enrollment.save
          end
        end
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        puts "NEW NEW NEW NEW NEW"
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    #remove program field in params
    if !params[:student][:enrollments_attributes].nil?
      params[:student] ||= {}
      params[:student][:enrollments_attributes] ||= []
      params[:student][:enrollments_attributes].each { |key, value| value.shift}
    end
    puts params[:student]
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
