require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  
  # Relationships
  should have_many(:guardians)
  should have_many(:students)

  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_presence_of(:zip)
  
  should validate_format_of(:zip).with(/^\d{5}(\-\d{4})?$/)
  
  should validate_numericality_of(:lat)
  should validate_numericality_of(:lon)

end
