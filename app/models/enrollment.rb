class Enrollment < ActiveRecord::Base
  attr_accessible :student_id, :section_id

  #Relationships
  belongs_to :section
  belongs_to :student
  
  has_one :program, :through => :section
  
  # Scopes
  scope :active, joins(:section).where('sections.active = ?', true)
  
  #Validations
  validates_presence_of :section_id, :student_id
  validates_numericality_of :student_id, :section_id, :greater_than_or_equal_to => 0

end
