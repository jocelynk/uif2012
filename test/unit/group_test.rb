require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  #Test Relationships
  should have_many(:registrations)
  should have_many(:programs).through(:registrations)
  
  #Test Validations
  should validate_presence_of(:name)
  should validate_numericality_of(:max_capacity, :greater_than => 1
  # validates_numericality_of :max_capacity, :greater_than => 1, :message => "must be greater than 1", :allow_nil => true
  
end
