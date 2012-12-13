class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  #before_filter :check_login
  before_filter :authenticate_user!,  :set_controller_and_action_names
  
  respond_to :html, :xml, :json, :js
  def index
    @students = Student.alphabetical.not_visitor
    @visitors = Student.alphabetical.is_visitor
    @query = Student.search(params[:query])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @student.cell_phone = "N/A" if @student.cell_phone.nil?
    @recent_activities = @student.recent_activity
    # @notes = @student.notes.by_priority.limit(4)  -- this is for the home page; here we want all notes in reverse chron order
    @notes = @student.notes.by_date_desc.all
    @department = Student.joins('INNER JOIN enrollments e ON students.id = e.student_id INNER JOIN sections s ON s.id = e.section_id INNER JOIN programs p ON p.id = s.program_id INNER JOIN departments d ON d.id = p.department_id').where('students.id = ?', @student.id).select('DISTINCT d.name as department')
    @notable = @student
    respond_with(@student) do |format|
      format.js { render json: @student, :callback => params[:callback] }
      format.pdf {prawnto filename: @student.proper_name, :inline => false }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new
    @data = params[:data]
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
    
    #need to add in household id for students?
    @student = Student.new(params[:student]) #:household_id => @household.id
    @household = Household.new(params[:household])
    respond_to do |format|
      if @student.save and @household.save
        @student.update_attributes({:household_id => @household.id})         
        unless @enrollments.nil? || @enrollments.empty?
          @enrollments.each do |reg|
            @enrollment = Enrollment.new({:student_id =>@student.id, :section_id => reg.second["section_id"].to_i})
            @enrollment.save
          end
        end
        format.html { redirect_to @student, notice: 'A visitor was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      elsif @student.save and @student.is_visitor
        @destroy_student = Student.find_by_id(@student.id)
        @destroy_student.destroy
        @student = Student.new
        format.html { render action: "new" }
      elsif @household.save
        @destroy_household = Household.find_by_id(@household.id)
        @destroy_household.destroy
        format.html { render action: "new" }
        #format.json { render json: @student.errors, status: :unprocessable_entity } 
      elsif @student.save
        unless @enrollments.nil? || @enrollments.empty?
          @enrollments.each do |reg|
            @enrollment = Enrollment.new({:student_id =>@student.id, :section_id => reg.second["section_id"].to_i})
            @enrollment.save
          end
        end
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
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

  
  def id
    puts params[:id]
    @student = Student.find_by_id(params[:id])
    if @student
      respond_to do |format|
      	format.html
      	format.json { render json: @student }
      end
    else
      respond_to do |format|
      	format.html
      	format.json { render error: "Cannot find student" }
      end
    end
  end
end
