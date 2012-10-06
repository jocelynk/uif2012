require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  #Test Relationships
  should have_many(:registrations)
  should have_many(:programs).through(:registrations)
  
  #Test Validations
  should validate_presence_of(:name)
  should validate_numericality_of(:max_capacity).with_message("must be greater than 1")
end
