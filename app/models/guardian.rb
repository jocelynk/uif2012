class Guardian < ActiveRecord::Base
  attr_accessible :active, :can_text, :cell_phone, :email, :first_name, :guardian_type, :household_id, :last_name


  #Relationships
  belongs_to :household
  # has_many :registrations
  # has_many :programs, :through => :registrations

  #Validations
  validates_presence_of :first_name, :last_name, :guardian_type, :cell_phone


end
