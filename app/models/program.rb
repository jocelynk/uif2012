class Program < ActiveRecord::Base 

  attr_accessible :active, :department_id, :description, :max_capacity, :max_grade, :min_grade, :name

  #Relationships
  belongs_to :department
  has_many :events
  has_many :registrations
  has_many :groups, :through => :registrations
  has_many :locations, :through => :events
  
  #Validations
  validates_presence_of :name, :max_grade, :min_grade, :max_capacity
  validates_uniqueness_of :name
  validates_numericality_of :max_capacity, :max_grade, :min_grade, :only_integer => true, :greater_than => 0, :message => "can only be whole number."
  validates_inclusion_of :max_grade, :min_grade, :in => 1..12, :message => "grades are between 1 and 12"
  validate :max_grade_greater_than_min_grade

  #Methods
  def max_grade_greater_than_min_grade
    errors.add(:max_grade, "must be greater than min grade") unless self.max_grade.to_i > self.min_grade.to_i
  end


end
