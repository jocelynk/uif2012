require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Relationships
  should have_many(:guardians)
  should have_many(:students)

  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_presence_of(:zip)
  should validate_presence_of(:insurance_company)
  
  should validate_format_of(:zip).with(/^\d{5}$/)
  
  should validate_numericality_of(:lat)
  should validate_numericality_of(:lon)

end
