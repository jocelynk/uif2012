class Team < ActiveRecord::Base
  attr_accessible :active, :max_capacity, :name

  #Relationships
  has_many :registrations
  has_many :programs, :through => :registrations

  #Validations
  validates_presence_of :active, :max_capacity, :name
  validates_numericality_of :max_capacity, :greater_than => 1, :message => "must be greater than 1"
  
end
