class Team < ActiveRecord::Base
  attr_accessible :active, :max_capacity, :name

  #Relationships
  has_many :registrations
  has_many :programs, :through => :registrations

  #Validations
  validates_presence_of :active, :max_capacity, :name
  
end
