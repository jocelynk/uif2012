class Section < ActiveRecord::Base
  attr_accessible :active, :max_capacity, :name, :program_id, :enrollments_attributes
  #Relationships
  belongs_to :program
  has_many :enrollments, :dependent => :delete_all
  has_many :section_events, :dependent => :delete_all
  has_many :events, :through => :section_events
  
  #Nested attributes
  accepts_nested_attributes_for :enrollments

  

  #Validations
  validates_presence_of :name
  validates_numericality_of :max_capacity, :greater_than => 1, :message => "must be greater than 1", :allow_nil => true
  
  #validation for sum of max_capacity for team is less than max_capacity of program
  #Scopes
 # scope :program_capacity, join(:enrollments, :programs)
  
  #Methods
 # def team_cap_less_than_program_cap
    
 # end
  
end

# def team_cap_less_than_program_cap
#   Team.sum(:max_capacity).where 
 #   x = self.joins(:enrollments, :programs)
#    x.sum(:max_capacity).where("enrollments.program_id = ?",  
    
 #   lambda {|employee_id| joins(:assignment, :employee).where("assignments.employee_id = ?", employee_id)
 #end
 
 #association is weird - how can a team have many programs

