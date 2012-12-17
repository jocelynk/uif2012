class NotesController < ApplicationController

  def index
    @notes = Note.by_priority.by_date_desc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end


  def show
    @note = Note.find(params[:id])
    @note_user = @note.user.username
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end


  def new
    @note = Note.new
    # e.g., new_note_path(:id => student.id, :source => 'student')
    unless params[:id].nil? || params[:source].nil?
      @klass = params[:source]
      @klass_id = params[:id]
      if params[:source] == 'student'
        student = Student.find(params[:id])
        @note_focus = student.proper_name
      else
        @note_focus = 'Event'
      end
       
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end


  def edit
    @note = Note.find(params[:id])
  end

  def create
    @notable = find_notable
    @note = @notable.notes.build(params[:note])
    @note.user_id = current_user.id
    @note.date = Date.today
    if @note.save
      flash[:notice] = "Successfully created note."
      noting_on = @note.notable_type.pluralize
      id = @note.notable_id
      # b/c of asset pipeline we will simply use the following eval hack (quick and painless):
      eval "redirect_to #{@note.notable_type.downcase}_path(:id=>#{id})"
    else
      render :action => 'new'
    end
  end


  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end
  
  def alerts
    @alerts = Note.alerts.by_priority.by_date_desc.active.all
  end
  
  def dismiss
    @note = Note.find(params[:id])
    @note.update_attribute(:active, false)
    redirect_to alerts_path
  end
  
  
  private
  def find_notable
    if params[:note][:hidden_klass] && params[:note][:hidden_id]
      return params[:note][:hidden_klass].classify.constantize.find(params[:note][:hidden_id])
    else
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end
    nil
  end
end
