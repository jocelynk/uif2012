class Household < ActiveRecord::Base
  attr_accessible :active, :church, :city, :insurance_company, :insurance_number, :lat, :lon, :name, :street, :street2, :zip


  # Relationships
  has_many :guardians
  has_many :students

  #Validations
  validates_presence_of :name, :street, :city, :zip, :insurance_company
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long"
  validates_numericality_of :lat, :lon, :allow_blank => true
  
end
