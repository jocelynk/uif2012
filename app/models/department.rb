class Department < ActiveRecord::Base
  attr_accessible :active, :description, :name

  #Relationships
  has_many :programs
  validates_presence_of :name, :active
  validates_uniqueness_of :name
end
