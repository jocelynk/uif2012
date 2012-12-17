class Section < ActiveRecord::Base
  attr_accessible :active, :max_capacity, :name, :program_id, :enrollments_attributes
  #Relationships
  belongs_to :program
  has_many :enrollments, :dependent => :delete_all
  has_many :section_events, :dependent => :delete_all
  has_many :events, :through => :section_events
  
  #Nested attributes
  accepts_nested_attributes_for :enrollments

  scope :active, where('active = ?', true) 
  scope :alphabetical, joins(:program).order('programs.name, sections.name')

  #Validations
  validates_presence_of :name
  validates_numericality_of :max_capacity, :greater_than => 1, :message => "must be greater than 1", :allow_nil => true
  
  
end
