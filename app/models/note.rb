class Note < ActiveRecord::Base
  attr_accessible :contents, :date, :notable_id, :notable_type, :priority, :user_id, :title
  
  # Set up comments as polymorphic
  belongs_to :notable, :polymorphic => true

  # Other relationships
  belongs_to :user
  
  # Scopes
  scope :by_priority, order('priority')
  # Priorities for drop-down, etc.
  PRIORITIES = [['High', 'high'],['Medium', 'medium'],['Low', 'low']]
  
end
