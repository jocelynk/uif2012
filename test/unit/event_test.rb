require 'test_helper'

class EventTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:program)
  should belong_to(:location)
  should have_many(:attendences)

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

  # we don't have attendence foreign key yet
  # should allow_value(1000001).for(:attendence_id)
  # should_not allow_value("bah").for(:attendence_id)
  # should_not allow_value(-13).for(:attendence_id)
  # should_not allow_value(3.14159).for(:attendence_id)
  # should_not allow_value(nil).for(:attendence_id)

  should allow_value(2).for(:meals_served)
  should_not allow_value(-13).for(:meals_served)
  should_not allow_value("bah").for(:meals_served)
  should_not allow_value(3.14159).for(:meals_served)
  should_not allow_value(nil).for(:meals_served)

  # for date
  should allow_value(7.weeks.ago.to_date).for(:date)
  should allow_value(2.years.ago.to_date).for(:date)
  # should_not allow_value(1.week.from_now.to_date).for(:date)
  should_not allow_value("bad").for(:date)
  should_not allow_value(nil).for(:date)

  context "Creating a context" do
    # create the objects I want with factories
    setup do
      @cmu = FactoryGirl.create(:location)
      @choir = FactoryGirl.create(:program)
      @monday_class = FactoryGirl.create(:event, :location => @cmu, :program => @choir)

    end

    # and provide a teardown method as well
    teardown do
      @cmu.destroy
      @choir.destroy
      @monday_class.destroy
    end

    # # test validations
    # should "only accept date data for date field" do
    #   @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => "FRED")
    #   deny @shift_kj_bad.valid?
    #   @shift_kj_bad2 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => "14:00:00")
    #   deny @shift_kj_bad2.valid?
    #   @shift_kj_bad3 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => 2011)
    #   deny @shift_kj_bad3.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => 2.weeks.ago.to_date)
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "not allow date to be nil" do
    #   @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => nil)
    #   deny @shift_kj_bad.valid?
    # end
    # 
    # should "ensure that shift dates do not precede the assignment start date" do
    #   @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => 2.years.ago.to_date)
    #   deny @shift_kj_bad.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :date => 2.weeks.ago.to_date)
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "only accept time data for start time" do
    #   # KNOWN BUG: see https://github.com/adzap/validates_timeliness/issues/52
    #   # @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => "FRED")
    #   # deny @shift_kj_bad.valid?
    #   @shift_kj_bad2 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => "12:66")
    #   deny @shift_kj_bad2.valid?
    #   @shift_kj_bad3 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => 2011)
    #   deny @shift_kj_bad3.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => Time.local(2000,1,1,12,0,0))
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "only accept time data for end time" do
    #   # KNOWN BUG: see https://github.com/adzap/validates_timeliness/issues/52
    #   # @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => "FRED")
    #   # deny @shift_kj_bad.valid?
    #   # @shift_kj_bad2 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => "12:66")
    #   # deny @shift_kj_bad2.valid?
    #   @shift_kj_bad3 = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => 2011)
    #   deny @shift_kj_bad3.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => Time.local(2000,1,1,12,0,0), :end_time => Time.local(2000,1,1,16,0,0))
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "not allow start time to be nil" do
    #   @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :start_time => nil)
    #   deny @shift_kj_bad.valid?
    # end
    # 
    # should "allow end time can be nil" do
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => nil)
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "ensure that shift end times do not precede the shift start time" do
    #   @shift_kj_bad = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => Time.local(2000,1,1,10,0,0))
    #   deny @shift_kj_bad.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn, :end_time => Time.local(2000,1,1,14,0,0))
    #   assert @shift_kj_good.valid?
    # end
    # 
    # should "ensure that shift are only given to current assignments" do
    #   @shift_ben_bad = FactoryGirl.build(:shift, :assignment => @assign_ben)
    #   deny @shift_ben_bad.valid?
    #   @shift_kj_good = FactoryGirl.build(:shift, :assignment => @assign_kathryn)
    #   assert @shift_kj_good.valid?
    # end
    # 
    # # test completed? method
    # should "have a completed? method that works properly" do
    #   deny @shift_cindy.completed?
    #   assert @shift_kathryn.completed?
    # end
    # 
    # should "have a scope to order chronologically" do
    #   assert_equal ['Ralph','Ralph','Ralph','Kathryn','Ralph','Cindy','Ed'], Shift.chronological.map{|s| s.employee.first_name}
    # end

  end


end
