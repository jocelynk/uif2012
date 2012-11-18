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

  def checkin
    @event_details = Event.joins('INNER JOIN section_events AS se ON se.event_id = events.id INNER JOIN sections s ON s.id = se.section_id').where('events.id = ?', params[:event_id]).select('s.name AS section, events.date')
    if params[:barcode] && params[:event_id]
      @student = Student.find_by_barcode_number(params[:barcode])
      if @student && @student.attendances.create(event_id: params[:event_id])
        render :json => { message: "#{@student.proper_name} was successfully scanned!" }
      else
        render :json => { error: 'There was something wrong with the scan!' }
      end
    end
  end
end
