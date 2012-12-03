class Household < ActiveRecord::Base
  attr_accessible :active, :church, :city, :insurance_company, :insurance_number, :lat, :lon, :name, :street, :street2, :zip


  # Relationships
  has_many :guardians
  has_many :students
  has_many :notes, :as => :notable, :dependent => :destroy

  #Validations
  validates_presence_of :name, :street, :city, :zip
  validates_format_of :zip, :with => /^\d{5}(\-\d{4})?$/, :message => "should be five digits long"
  validates_numericality_of :lat, :lon, :allow_blank => true
  
  #Scopes
  scope :alphabetical,   order("name")
  
end
