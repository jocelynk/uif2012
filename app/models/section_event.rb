class SectionEvent < ActiveRecord::Base
  attr_accessible :event_id, :section_id
  
  belongs_to :section
  belongs_to :event
end
