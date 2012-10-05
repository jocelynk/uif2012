require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Relationships
  should belong_to(:household)
  
  # Validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:guardian_type)
  should validate_presence_of(:cell_phone)
  
  # should have_many(:registrations)
  # should have_many(:programs).through(:registrations)
  
end
