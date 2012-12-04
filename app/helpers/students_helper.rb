module StudentsHelper
  def get_households
    Household.alphabetical.all.map{|h| ["#{h.name} (#{h.street})", h.id] }
  end

end
