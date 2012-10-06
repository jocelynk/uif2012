require 'test_helper'

class AttendenceTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:event)
  should belong_to(:student)
  
end
