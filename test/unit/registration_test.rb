require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
   #Test relationships
  should belong_to(:section)
  should belong_to(:student)
  should belong_to(:program)
end
