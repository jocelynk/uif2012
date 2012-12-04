class Allergy < ActiveRecord::Base
  attr_accessible :active, :name, :warning_text
  
  has_many :student_allergies, :dependent => :delete_all
  has_many :students, :through => :student_allergies
  #validates_presence_of :name
  
  scope :by_studentallergy, joins(:student_allergy)
  scope :alphabetical, order(:name)
end


