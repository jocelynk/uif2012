class Registration < ActiveRecord::Base
  attr_accessible :student_id, :section_id

  #Relationships
  belongs_to :section
  belongs_to :student
  
  has_one :program, :through => :section
  
end
