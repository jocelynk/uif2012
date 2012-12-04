require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  # test Relationships
  should belong_to(:household)
  should have_many(:student_allergies)
  should have_many(:attendances)
  should have_many(:enrollments)
  
  #test Presences
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:grade)
  should validate_presence_of(:date_of_birth)
  
  #Test values
  should allow_value(4).for(:grade)
  should_not allow_value("fourth").for(:grade)
  should_not allow_value(-4).for(:grade)
  should_not allow_value(3.14159).for(:grade)
  should_not allow_value(0).for(:grade)
  should_not allow_value(27).for(:grade)
  should_not allow_value(nil).for(:grade)

  should allow_value("Anthony").for(:first_name)
  should allow_value("Lorubbio").for(:last_name)
  
  should allow_value("412.338.1414").for(:cell_phone)
  should allow_value("412-338-1414").for(:cell_phone)
  should allow_value("4123381414").for(:cell_phone)
  should allow_value("412 338 1414").for(:cell_phone)
  should_not allow_value("threefourfive").for(:cell_phone)
  should_not allow_value("123-4567").for(:cell_phone)

  
  
end
