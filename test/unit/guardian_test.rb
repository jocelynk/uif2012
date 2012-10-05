require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:registrations)
  should have_many(:programs).through(:registrations)
  
end
