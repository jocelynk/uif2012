require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:section)
  should belong_to(:student)
  
  #Test Validations
  should validate_presence_of(:section_id)
  should validate_presence_of(:student_id)
  
  #Test Values
  should allow_value(4).for(:section_id)
  should allow_value(1234).for(:section_id)
  should_not allow_value("four").for(:section_id)
  should_not allow_value(-4).for(:section_id)
  
  should allow_value(4).for(:student_id)
  should allow_value(309486).for(:student_id)
  should_not allow_value("four").for(:student_id)
  should_not allow_value(-4).for(:student_id)
  
end
