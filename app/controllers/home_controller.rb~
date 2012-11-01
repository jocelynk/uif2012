class HomeController < ApplicationController
  def index
   @events = Event.current
   @barcode = params[:barcode]
     puts "------init------"
     @print = "your barcode is: #{@barcode}";  
     puts @print


     if (!@barcode.nil?)
       flash[:notice] = "Barcode was successfully scanned"
     else
       flash[:notice] = "There was something wrong with the scanning!" 
     end
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
