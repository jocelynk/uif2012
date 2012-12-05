class Note < ActiveRecord::Base
  attr_accessible :contents, :date, :notable_id, :notable_type, :priority, :user_id, :title, :hidden_id, :hidden_klass
  attr_accessor :hidden_id, :hidden_klass
  
  # Set up comments as polymorphic
  belongs_to :notable, :polymorphic => true

  # Other relationships
  belongs_to :user
  
  # Scopes
  scope :by_priority, order('priority')
  scope :by_date_desc, order('date DESC')
  scope :alerts, where('priority < ?', 3)
  scope :last_six, limit(6)
  scope :active, where('active = ?', true)
  
  
  # Priorities for drop-down, etc.
  PRIORITIES = [['High', 1],['Medium', 2],['Low', 3]]
  
  
  
end
