class Note < ActiveRecord::Base
  attr_accessible :contents, :date, :notable_id, :notable_type, :priority, :user_id
  
  
  belongs_to :user, :polymorphic => true
  
  # Priorities for drop-down, etc.
  PRIORITIES = [['High', 'high'],['Medium', 'medium'],['Low', 'low']]
  
end
