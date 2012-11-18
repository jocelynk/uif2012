class Attendance < ActiveRecord::Base
  attr_accessible :event_id, :exempt, :student_id

  #Relationships
  belongs_to :event
  belongs_to :student

  #Validations
  validates_presence_of :event_id, :student_id
  validates_uniqueness_of :student_id, :scope => :event_id

  #Scopes

  #Events are active in system
  def event_is_active_in_system
    all_active_events = Event.active.all.map{|e| e.id}
    unless all_active_events.include?(self.event_id)
      errors.add(:event_id, "is not an event in the system")
    end
  end

  def student_is_current_in_system
    all_current_students = Student.current.all.map{|s| s.id}
    unless all_current_students.include?(self.student_id)
      errors.add(:student_id, "is not a current student in the system")
    end
  end

end
