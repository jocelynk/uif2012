require 'carrierwave/orm/activerecord'

class Student < ActiveRecord::Base
  attr_accessible :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :grade, :household_id, :is_male, :last_name, :photo, :status, :enrollments_attributes
  before_save :reformat_phone
  
  mount_uploader :photo, PhotoUploader
  
  #Relationships
  belongs_to :household
  has_many :attendances, :dependent => :delete_all
  has_many :enrollments, :dependent => :delete_all
  has_many :student_allergies, :dependent => :delete_all
  has_many :allergies, :through => :student_allergies
  has_many :events, :through => :attendances
  has_many :notes, :as => :notable, :dependent => :destroy
  
  #Nested Attributes
  accepts_nested_attributes_for :enrollments, :allow_destroy => true
  
  #Validations
  validates_presence_of :first_name, :last_name
  validates_presence_of :grade, :date_of_birth#, :unless Proc.new { |s| s.is_visitor == 't'}
  validates :date_of_birth, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes or spaces only"
  #/^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :allow_blank => true, :message => "is not a valid format"
  validates_numericality_of :grade, :only_integer => true, :message => "is not a valid number"
  validates_inclusion_of :grade, :in => 1..12, :message => "grades are between 1 and 12"
  
  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('last_name, first_name')

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
    # .length works sometimes, but for now use !query
    if !query
        return 0
    else
      sql = query.split.map do |word|
        %w[first_name last_name].map do |column|
          sanitize_sql ["#{column} LIKE ?", "%#{word}%"]
        end.join(" or ")
      end.join(") and (")
      where(sql)
    end
  end
  
  def recent_activity
    Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id INNER JOIN section_events se ON se.event_id = e.id INNER JOIN sections ON sections.id = se.section_id').
    where('students.id = ? AND e.date > ?', self.id, 5.days.ago.to_date).select('sections.name AS "section",e.id AS "event", e.date AS "date"').order('"date"')
    
    #Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id').
    #where('students.id = ? AND e.date > ?', self.id, 5.days.ago.to_date).select('students.last_name AS "ln", e.id AS "event", e.date AS "date"')
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
