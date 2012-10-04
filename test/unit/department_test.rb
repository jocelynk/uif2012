require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  #Test relationships
  should have_many(:programs)
  
  context "3 Departments" do
     # create the objects I want with factories
     setup do
       @arts = FactoryGirl.create(:department)
       @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
       @outreach = FactoryGirl.create(:department, :name => "Global Outreach", :description => "Reaching Out")
     
     end

     # and provide a teardown method as well
     teardown do
       @arts.destroy
       @athletics.destroy
       @outreach.destroy
     end
end
