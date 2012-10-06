class Student < ActiveRecord::Base
  attr_accessible :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :grade, :household_id, :is_male, :last_name, :photo, :status

  #Relationships
  belongs_to :household
  has_many :attendances
  has_many :registrations
  has_many :student_allergies

  #Validations
  validates_presence_of :first_name, :last_name, :is_male, :grade, :date_of_birth, :cell_phone
  validates :date_of_birth, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
end
