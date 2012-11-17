require 'test_helper'

class SectionEventTest < ActiveSupport::TestCase
  should belong_to(:section)
  should belong_to(:event) 
  
  #Test values
  should allow_value(4).for(:section_id)
  should_not allow_value("four").for(:section_id)
  should_not allow_value(-4).for(:section_id)

  should allow_value(5).for(:event_id)
  should_not allow_value("five").for(:event_id)
  should_not allow_value(-5).for(:event_id)
end
