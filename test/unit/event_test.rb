require 'test_helper'

class EventTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:program)
  should belong_to(:location)
  should have_many(:attendances)
  should have_many(:sections).through(:section_events)
  
  #Test values
  should allow_value(4).for(:location_id)
  should allow_value(1000001).for(:location_id)
  should_not allow_value("bah").for(:location_id)
  should_not allow_value(-13).for(:location_id)
  should_not allow_value(3.14159).for(:location_id)
  should_not allow_value(nil).for(:location_id)
  should allow_value(2).for(:program_id)

  should allow_value(1000001).for(:program_id)
  should_not allow_value("bah").for(:program_id)
  should_not allow_value(-13).for(:program_id)
  should_not allow_value(3.14159).for(:program_id)
  should_not allow_value(nil).for(:program_id)
  should allow_value(2).for(:program_id)

  should allow_value(2).for(:meals_served)
  should allow_value(0).for(:meals_served)
  should_not allow_value(-13).for(:meals_served)
  should_not allow_value("bah").for(:meals_served)
  should_not allow_value(3.14159).for(:meals_served)
  should_not allow_value(nil).for(:meals_served)
  
  context "Creating a context" do
     # create the objects I want with factories
     setup do
       @arts_department = FactoryGirl.create(:department)
       @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
       @academics = FactoryGirl.create(:department, :name => "Academics", :description => "Learning");

       @cmu = FactoryGirl.create(:location)
       
       @choir = FactoryGirl.create(:program, :department => @arts_department)
       @soccer = FactoryGirl.create(:program, :name => "Soccer", :description => "Kick a ball", :department => @athletics)
       @sat_prep = FactoryGirl.create(:program, :name => "SAT Prep", :description => "Prepare for SATs", :department => @academics)       
       @mon_class = FactoryGirl.create(:event, :location => @cmu, :program => @choir)
       @tues_class = FactoryGirl.create(:event, :location => @cmu, :program => @soccer, :date => 3.days.ago.to_date, :start_time => Time.local(2012,10,3,16,0), :end_time => Time.local(2012,10,3,17,0))
       @wed_class = FactoryGirl.create(:event, :location => @cmu, :program => @sat_prep, :date => 4.days.from_now.to_date, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
       @today_class = FactoryGirl.create(:event, :location => @cmu, :program => @sat_prep, :date => Date.today, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
     end

     # and provide a teardown method as well
     teardown do
       @arts_department.destroy
       @athletics.destroy
       @academics.destroy
       
       @cmu.destroy
       
       @choir.destroy
       @soccer.destroy
       @sat_prep.destroy
       
       @mon_class.destroy
       @tues_class.destroy
       @wed_class.destroy
       @today_class.destroy
     end
     
    # test validations
    should "only accept date data for date field" do
      @event_bad = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :date => "FRED")
      deny @event_bad.valid?
      @event_bad2 = FactoryGirl.build(:event, :location => @cmu,  :program => @choir, :date => "14:00:00")
      deny @event_bad2.valid?
      @event_bad3 = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :date => 2011)
      deny @event_bad3.valid?
      @event_good = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :date => 2.weeks.ago.to_date)
      assert @event_good.valid?
    end
    
    should "not allow date to be nil" do
      @event_bad = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :date => nil)
      deny @event_bad.valid?
    end
    
    should "only accept time data for start time" do
      # KNOWN BUG: see https://github.com/adzap/validates_timeliness/issues/52
      # @event_bad = FactoryGirl.build(:event, :location => @cmu, :start_time => "FRED")
      # deny @event_bad.valid?
      @event_bad2 = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :start_time => "12:66")
      deny @event_bad2.valid?
      @event_bad3 = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :start_time => 2011)
      deny @event_bad3.valid?
      @event_good = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :start_time => Time.local(2000,1,1,12,0,0))
      assert @event_good.valid?
    end
    
    should "only accept time data for end time" do
      # KNOWN BUG: see https://github.com/adzap/validates_timeliness/issues/52
      # @event_bad = FactoryGirl.build(:event, :location => @cmu, :end_time => "FRED")
      # deny @event_bad.valid?
      # @event_bad2 = FactoryGirl.build(:event, :location => @cmu, :end_time => "12:66")
      # deny @event_bad2.valid?
      @event_bad3 = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :end_time => 2011)
      deny @event_bad3.valid?
      @event_good = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :start_time => Time.local(2000,1,1,12,0,0), :end_time => Time.local(2000,1,1,16,0,0))
      assert @event_good.valid?
    end
    
    should "not allow start time to be nil" do
      @event_bad = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :start_time => nil)
      deny @event_bad.valid?
    end
    
    should "allow end time can be nil" do
      @event_good = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :end_time => nil)
      assert @event_good.valid?
    end
    
    should "ensure that event end times do not precede the event start time" do
      @event_bad = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :end_time => Time.local(2000,1,1,10,0,0))
      deny @event_bad.valid?
      @event_good = FactoryGirl.build(:event, :location => @cmu, :program => @choir, :end_time => Time.local(2013,1,1,14,0,0))
      assert @event_good.valid?
    end
    
    should "have a scope to order chronologically" do
      assert_equal ["Soccer","Choir","SAT Prep", "SAT Prep"], Event.chronological.map{|s| s.program.name}
    end
    
    should "have a scope for happening events" do
      @program = FactoryGirl.create(:program, :name => "Acting", :department => @arts_department)
      @event = FactoryGirl.create(:event, :location => @cmu, :program => @program, :date => Date.today, :start_time => Time.now, :end_time => nil)
      assert_equal ['SAT Prep', 'Acting'], Event.happening_events.map{|s| s.program.name}
      @program.destroy
      @event.destroy
    end
  end


end
