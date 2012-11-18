require 'test_helper'

class StudentAllergyTest < ActiveSupport::TestCase
  # test Relationships
  should belong_to(:allergy)
  should belong_to(:student)

  #Test values
  should allow_value(4).for(:allergy_id)
  should_not allow_value("four").for(:allergy_id)
  should_not allow_value(-4).for(:allergy_id)

  should allow_value(5).for(:student_id)
  should_not allow_value("five").for(:student_id)
  should_not allow_value(-5).for(:student_id)
end
