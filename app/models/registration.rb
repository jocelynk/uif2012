class Registration < ActiveRecord::Base
  attr_accessible :program_id, :student_id, :section_id

  #Relationships
  belongs_to :section
  belongs_to :program
  belongs_to :student
  
  validates_presence_of :program_id, :section_id, :student_id

  
end
