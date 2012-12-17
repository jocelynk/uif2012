class Event < ActiveRecord::Base
  attr_accessible :bibles_distributed, :date, :end_time, :gospel_shared, :meals_served, :program_id, :start_time, :location_id, :sections
  
  #Relationships
  belongs_to :program
  belongs_to :location
  has_many :attendances, :dependent => :delete_all
  has_many :section_events, :dependent => :delete_all
  has_many :students, :through => :attendances
  has_many :sections, :through => :section_events
  has_many :notes, :as => :notable, :dependent => :destroy
   
  #Validations
  validates_date :date
  validates_time :start_time, :message => "must enter a start time"
  validates_time :end_time, :after => :start_time, :after_message => "must be after the start of the event"
  validates_numericality_of :location_id, :program_id, :only_integer => true, :greater_than => 0, :message => "is not a valid number"
  validates_numericality_of :meals_served, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => false, :message => "is not a valid number"
   validates_numericality_of :bibles_distributed, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => false, :message => "is not a valid number"

  
    
  #Scopes
  scope :happening_events, where('end_time IS NULL AND date = ?', Date.today)
  scope :chronological, order(:date, :start_time)
  scope :past, where('date < ?', Date.today)
  scope :upcoming, where('date >= ?', Date.today)
  scope :current, where('date = ?', Date.today)
  scope :by_date, order('date')
  scope :by_date_desc, order('date DESC')
  

  # virtual attributes section_ids - corresponds with ids of sections of each event
  def section_names
    Section.all.collect{|s| s.name}.join(', ')
  end
  
  def section_id
    @section_ids ||  Section.all.collect{|s| s.id}
  end
  
  def section_ids=(id_array)
    @sections_ids = id_array.collect{|id| id.to_i}
  end
    
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
    attendees = Student.joins("INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id").where('e.id = ?', id).order('last_name, first_name') 

    return nil if attendees.empty?
    attendees # return as a single object, not an array
  end
  
  def self.absentees(id)
    attendees = Student.joins("INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id").where('e.id = ?', id).select('students.id').map{|s|s.id}
    absentees = Student.joins('INNER JOIN enrollments r ON r.student_id = students.id INNER JOIN sections s ON s.id = r.section_id INNER JOIN section_events se ON se.section_id = s.id INNER JOIN events e ON e.id = se.event_id').where('e.id = ? AND students.id NOT IN (?)', id, attendees).order('last_name, first_name')
    all_students = Student.joins('INNER JOIN enrollments r ON r.student_id = students.id INNER JOIN sections s ON s.id = r.section_id INNER JOIN section_events se ON se.section_id = s.id INNER JOIN events e ON e.id = se.event_id').where('e.id = ?', id).order('last_name, first_name')
    if(!absentees.empty?)
      puts "Absentees is not empty"
      puts absentees.length
      absentees
    elsif(attendees.length <1 && !all_students.empty?)
      puts "Returning All students"
            puts all_students.length
      all_students
    else
      nil
    #return all_students if attendees.length < 1 && !all_students.empty? else return nil
    #absentees
    end
  end
 
  
  def self.get_todays_date
    t = Time.now
    return t.strftime("%b %d")
  end

end

