require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:department)
  should have_many(:events)
  should have_many(:registrations)
  should have_many(:groups).through(:registrations)
  should have_many(:locations).through(:events)
  
  #Test validations
  should validate_presence_of(:name)
  should validate_presence_of(:max_grade)
  should validate_presence_of(:min_grade)
  should validate_presence_of(:max_capacity)
  should validate_uniqueness_of(:name)
  
  # for max/min capacity
  should allow_value(1).for(:max_grade)
  should allow_value(2).for(:max_grade)
  should allow_value(3).for(:max_grade)
  should allow_value(4).for(:max_grade)
  should allow_value(5).for(:max_grade)
  should allow_value(6).for(:max_grade)
  should allow_value(7).for(:max_grade)
  should allow_value(8).for(:max_grade)
  should allow_value(9).for(:max_grade)
  should allow_value(10).for(:max_grade)
  should allow_value(11).for(:max_grade)
  should allow_value(12).for(:max_grade)
  should allow_value(1).for(:min_grade)
  should allow_value(2).for(:min_grade)
  should allow_value(3).for(:min_grade)
  should allow_value(4).for(:min_grade)
  should allow_value(5).for(:min_grade)
  should allow_value(6).for(:min_grade)
  should allow_value(7).for(:min_grade)
  should allow_value(8).for(:min_grade)
  should allow_value(9).for(:min_grade)
  should allow_value(10).for(:min_grade)
  should allow_value(11).for(:min_grade)
  should allow_value(12).for(:min_grade)
  should_not allow_value("bad").for(:max_grade)
  should_not allow_value(0).for(:max_grade)
  should_not allow_value(2.5).for(:max_grade)
  should_not allow_value(-2).for(:max_grade)
  should_not allow_value("bad").for(:min_grade)
  should_not allow_value(0).for(:min_grade)
  should_not allow_value(2.5).for(:min_grade)
  should_not allow_value(-2).for(:min_grade)
  should allow_value(12).for(:max_capacity)
  should_not allow_value(0).for(:max_capacity)
  should_not allow_value("bad").for(:max_capacity)
  should_not allow_value(-2).for(:max_capacity)
  should_not allow_value(2.5).for(:max_capacity)
  
  context "creating the context" do
     # create the objects I want with factories
     setup do
       @arts = FactoryGirl.create(:department)
       @choir = FactoryGirl.create(:program, :department => @arts )
       @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
     end

     # and provide a teardown method as well
     teardown do
       @arts.destroy
       @athletics.destroy
       @choir.destroy
     end
     
     should "not max grade to be less than min grade" do
       # since Ed finished his last assignment a month ago, let's try to assign the lovable loser again ...
       @program = FactoryGirl.build(:program, :department => @athletics, :max_grade => 4, :min_grade => 11)
       deny @program.valid?
     end
     
     
  end
end
