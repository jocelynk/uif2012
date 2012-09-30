class Event < ActiveRecord::Base
  attr_accessible :bibles_distributed, :date, :end_time, :gospel_shared, :location_id, :meals_server, :program_id, :start_time
end
