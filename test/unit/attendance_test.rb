require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:event)
  should belong_to(:student)
  
end
