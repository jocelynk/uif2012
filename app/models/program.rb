class Program < ActiveRecord::Base 

  attr_accessible :active, :department_id, :description, :max_capacity, :max_grade, :min_grade, :name, :start_date, :end_date

  #Relationships
  belongs_to :department
  has_many :events, :dependent => :delete_all
  has_many :sections, :dependent => :delete_all
  has_many :registrations, :through => :sections
  has_many :locations, :through => :events
  
  #Validations
  validates_presence_of :name, :max_grade, :min_grade, :max_capacity
  validates_uniqueness_of :name
  validates_numericality_of :max_capacity, :max_grade, :min_grade, :only_integer => true, :greater_than => 0, :message => "can only be whole number."
  validates_inclusion_of :max_grade, :min_grade, :in => 1..12, :only_integer => true, :message => "grades are between 1 and 12"
  validate :max_grade_greater_than_min_grade
  validates_date :start_date
  validates_date :end_date, :after => :start_date, :allow_blank => true, :after_message => "must be after the start of the program"

  #Nested Attributes
  accepts_nested_attributes_for :sections, :allow_destroy => true
  
  #Scopes
  scope :active, where('active = ? AND end_date IS NULL', true)
  scope :by_name, order('name')
  #Methods
  def max_grade_greater_than_min_grade
    errors.add(:max_grade, "must be greater than min grade") unless self.max_grade.to_i > self.min_grade.to_i
  end


end
