class Program < ActiveRecord::Base 

  attr_accessible :active, :department_id, :description, :max_capacity, :max_grade, :min_grade, :name, :start_date, :end_date, :scan_by_absence

  #Relationships
  belongs_to :department
  has_many :events, :dependent => :delete_all
  has_many :sections, :dependent => :delete_all
  has_many :enrollments, :through => :sections
  has_many :locations, :through => :events
  has_many :notes, :as => :notable, :dependent => :destroy
  
  #Validations
  validates_presence_of :name, :department_id, :max_grade, :min_grade, :max_capacity
  validates_uniqueness_of :name, :message => "name is already in use"
  validates_numericality_of :max_capacity, :max_grade, :min_grade, :only_integer => true, :message => "must be a whole number"
  validates_numericality_of :max_capacity, :max_grade, :min_grade, :greater_than => 0, :message => "must be greater than zero"
  validates_inclusion_of :max_grade, :min_grade, :in => 1..12, :only_integer => true, :message => "must be between 1 and 12"
  validate :max_grade_greater_than_min_grade
  validates_date :start_date
  validates_date :end_date, :after => :start_date, :allow_blank => true, :after_message => "must be after the start of the program"

  #Nested Attributes
  accepts_nested_attributes_for :sections, :allow_destroy => true
  
  #Scopes
  scope :active, where('active = ? AND end_date IS NULL', true)
  scope :past, where('end_date IS NOT NULL')
  scope :by_name, order('name')
  #Methods
  # def name=(s)
  #   write_attribute(:name, s.to_s.titleize)
  # end
  
  def max_grade_greater_than_min_grade
    errors.add(:max_grade, "must be greater than min grade") unless self.max_grade.to_i > self.min_grade.to_i
  end
  
  def grade_range
    "#{min_grade} - #{max_grade}"
  end
  
  def enddateformat
    if self.end_date
      return self.end_date.strftime("%b %d, %Y")
	  else
      "N/A"
    end
	end
	
	def hasdescription
    if self.description.length >0
      return self.description
    else
      return 'N/A'
    end
  end
end
