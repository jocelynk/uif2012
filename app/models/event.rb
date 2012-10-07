class Event < ActiveRecord::Base
  attr_accessible :bibles_distributed, :date, :end_time, :gospel_shared, :meals_served, :program_id, :start_time, :location_id

  #Relationships
  belongs_to :program
  belongs_to :location
  has_many :attendences
    
  #Validations
  validates_date :date
  validates_time :start_time
  validates_time :end_time, :after => :start_time, :allow_blank => true, :after_message => "must be after the start of the event"
  validates_numericality_of :location_id, :program_id, :only_integer => true, :greater_than => 0
  validates_numericality_of :meals_served, :only_integer => true, :greater_than_or_equal_to => 0

    
  #Scopes
  scope :happening_events, where('end_time IS NULL')
  scope :chronological, order(:date, :start_time)
end

