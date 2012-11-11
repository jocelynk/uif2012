require 'test_helper'

class LocationTest < ActiveSupport::TestCase
#Test Relationships
  should have_many(:events)
  should have_many(:programs).through(:events)
  
  #Test Validations
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_uniqueness_of(:name)
  
  # tests for zip
  should allow_value("15213").for(:zip)
  should_not allow_value("bad").for(:zip)
  should_not allow_value("1512").for(:zip)
  should_not allow_value("152134").for(:zip)
  should_not allow_value("15213-0983").for(:zip)
  
  # tests for lat/lon
  should allow_value(19.23).for(:lat)
  should allow_value(-19.23).for(:lat)
  should_not allow_value("bad").for(:lat)
  should allow_value(19.23).for(:lon)
  should allow_value(-19.23).for(:lon)
  should_not allow_value("bad").for(:lon)
  
  
  # Establish context
  # Testing other methods with a context
  context "Creating three locations" do
    # create the objects I want with factories
    setup do
      @cmu = FactoryGirl.create(:location)
      @new_jersey = FactoryGirl.create(:location, :name => "Jocelyn's Home", :street => "12 Somewhere Road", :city => "Someplace", :zip => '10000', :active => false)
      @oakland = FactoryGirl.create(:location, :name => "Oakland")
    end
    
    # and provide a teardown method as well
    teardown do
      @cmu.destroy
      @new_jersey.destroy
      @oakland.destroy
    end
  
    # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "CMU", @cmu.name
      assert @oakland.active
      deny @new_jersey.active
    end
    
    # test stores must have unique names
    should "force locations to have unique names" do
      repeat_store = FactoryGirl.build(:location, :name => "CMU")
      deny repeat_store.valid?
    end
  
    # test the scope 'active'
    should "shows that there are two active locations" do
      assert_equal 2, Location.active.size
      assert_equal ["CMU", "Oakland"], Location.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive location" do
      assert_equal 1, Location.inactive.size
      assert_equal ["Jocelyn's Home"], Location.inactive.alphabetical.map{|s| s.name}
    end
    
    # test the callback that gets store coordinates
    # should "get the the right coordinates for a location" do
    # assert_equal 40.4435037, @cmu.lat
    # assert_equal -79.9415706, @cmu.lon
    # end
  end  
end
