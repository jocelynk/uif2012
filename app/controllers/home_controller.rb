class HomeController < ApplicationController
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
end
