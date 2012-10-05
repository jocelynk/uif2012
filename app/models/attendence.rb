class Attendence < ActiveRecord::Base
  attr_accessible :event_id, :exempt, :student_id
  
  #Relationships
  belongs_to :event
  belongs_to :student
end
