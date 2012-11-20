require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  #Test Relationships
  should have_many(:enrollments)
  should belong_to(:program)
  should have_many(:section_events)
  should have_many(:events).through(:section_events)
  
  #Test Validations
  should validate_presence_of(:name)
  should validate_numericality_of(:max_capacity).with_message("must be greater than 1")
end
