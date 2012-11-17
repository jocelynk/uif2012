require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  #Test relationships
  should have_many(:programs)

  #Test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  context "3 Departments" do
    # create the objects I want with factories
    setup do
      @arts = FactoryGirl.create(:department)
      @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
      @outreach = FactoryGirl.create(:department, :name => "Global Outreach", :description => "Reaching Out", :active => false)

    end

    # and provide a teardown method as well
    teardown do
      @arts.destroy
      @athletics.destroy
      @outreach.destroy
    end

    # test the scope 'alphabetical'
    should "shows that there are three departments in in alphabetical order" do
      assert_equal ["Athletics", "Global Outreach", "Peforming Arts"], Department.alphabetical.map{|s| s.name}
    end

    # test the scope 'active'
    should "shows that there are two active stores" do
      assert_equal 2, Department.active.size
    end

    # test the scope 'inactive'
    should "shows that there is one inactive store" do
      assert_equal 1, Department.inactive.size
      assert_equal ["Global Outreach"], Department.inactive.alphabetical.map{|s| s.name}
    end
  end
end
