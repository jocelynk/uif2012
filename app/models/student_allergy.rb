class StudentAllergy < ActiveRecord::Base
  attr_accessible :allergy_id, :student_id
  
  belongs_to :allergies
  belongs_to :students
end
