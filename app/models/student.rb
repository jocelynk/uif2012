class Student < ActiveRecord::Base
  attr_accessible :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :grade, :household_id, :is_male, :last_name, :photo, :status, :registrations_attributes
  before_save :reformat_phone
  
  #Relationships
  belongs_to :household
  has_many :attendances
  has_many :registrations
  has_many :student_allergies
  has_many :allergies, :through => :student_allergies
  has_many :events, :through => :attendances
  
  #Nested Attributes
  accepts_nested_attributes_for :registrations, :allow_destroy => true
  
  #Validations
  validates_presence_of :first_name, :last_name, :grade, :date_of_birth, :cell_phone
  validates :date_of_birth, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :allow_blank => false, :message => "should be 10 digits (area code needed) and delimited with dashes only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format"
  
  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('last_name, first_name')
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes only"

  #Misc constants
  STATUS_LIST = [['Active', 'active'],['Inactive', 'inactive'],['College', 'college']]
  
  #Other methods
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
    
  def age
    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  end
  
  def self.search(query)
    if query
      sql = query.split.map do |word|
        %w[first_name last_name].map do |column|
          sanitize_sql ["#{column} LIKE ?", "%#{word}%"]
        end.join(" or ")
      end.join(") and (")
      where(sql)
    else
      scoped
    end
  end
  
  def recent_activity
    #not working b/c section not changing
    Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id INNER JOIN section_events se ON se.event_id = e.id INNER JOIN sections ON sections.id = se.section_id').
    where('students.id = ?', 1).select('sections.name AS "section",students.last_name, e.date').first
    
    Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id').
    where('students.id = ? AND e.date > ?', 1, 5.days.ago.to_date).select('students.last_name, e.date')
  end
  
  # Callback code
  # -----------------------------
  private
  # We need to strip non-digits before saving to db
  def reformat_phone
    phone = self.cell_phone.to_s # change to string in case input as all numbers
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.cell_phone = phone # reset self.phone to new string
  end
  
end
