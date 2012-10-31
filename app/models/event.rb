class Event < ActiveRecord::Base
  attr_accessible :bibles_distributed, :date, :end_time, :gospel_shared, :meals_served, :program_id, :start_time, :location_id

  #Relationships
  belongs_to :program
  belongs_to :location
  has_many :attendances
  has_many :section_events
  has_many :students, :through => :attendances
   
  #Validations
  validates_date :date
  validates_time :start_time, :message => "must enter a start time"
  validates_time :end_time, :after => :start_time, :allow_blank => true, :after_message => "must be after the start of the event"
  validates_numericality_of :location_id, :program_id, :only_integer => true, :greater_than => 0
  validates_numericality_of :meals_served, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => true

    
  #Scopes
  scope :happening_events, where('end_time IS NULL AND date = ?', Date.today)
  scope :chronological, order(:date, :start_time)
  scope :past, where('date < ?', Date.today)
  scope :upcoming, where('date >= ?', Date.today)
  scope :current, where('date = ?', Date.today)


  def self.by_date(date_query)
    if  date_query.nil?
      where('date = ?', Date.today)
    elsif date_query.to_a[0][1].blank?
      scoped
    else
      where(:date => Date.parse(date_query.to_a.sort.collect{|c| c[1]}.join("-")))
    end

  end
  
  def self.attendees(id)
    attendees = Student.joins("INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id").where('e.id = ?', id) 

    return nil if attendees.empty?
    attendees # return as a single object, not an array
  end
  
  def self.absentees(id)
    attendees = Student.joins("INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id").where('e.id = ?', id).select('students.id').map{|s|s.id}
    absentees = Student.joins('INNER JOIN registrations r ON r.student_id = students.id INNER JOIN sections s ON s.id = r.section_id INNER JOIN section_events se ON se.section_id = s.id INNER JOIN events e ON e.id = se.event_id').where('e.id = ? AND students.id NOT IN (?)', id, attendees)
    all_students = Student.joins('INNER JOIN registrations r ON r.student_id = students.id INNER JOIN sections s ON s.id = r.section_id INNER JOIN section_events se ON se.section_id = s.id INNER JOIN events e ON e.id = se.event_id').where('e.id = ?', id)
    return all_students if attendees.length < 1 && !all_students.empty? else return nil
    absentees
  end
  
end

