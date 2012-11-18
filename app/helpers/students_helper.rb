module StudentsHelper
  def get_households
    Household.all.map{|h| ["#{h.name} (#{h.street})", h.id] }
  end
  
  def test
  1..10
  end
  
end
