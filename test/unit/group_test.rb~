require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  #Test Relationships
  should have_many(:registrations)
  should have_many(:programs).through(:registrations)
  
  #Test Validations
  should validate_presence_of(:name)
  
end
