class SectionEvent < ActiveRecord::Base
  attr_accessible :event_id, :section_id
  
  belongs_to :section
  belongs_to :event
  
  validates_presence_of :section_id, :event_id
  validates_numericality_of :event_id, :section_id, :greater_than_or_equal_to => 0
end
