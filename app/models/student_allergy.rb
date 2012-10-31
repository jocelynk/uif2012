class StudentAllergy < ActiveRecord::Base
  attr_accessible :allergy_id, :student_id
  
  belongs_to :allergy
  belongs_to :student
  
  #Validations
  validates_presence_of :allergy_id, :student_id
  validates_numericality_of :allergy_id, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :student_id, :only_integer => true, :greater_than_or_equal_to => 0


end
