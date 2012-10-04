class Guardian < ActiveRecord::Base
  attr_accessible :active, :can_text, :cell_phone, :email, :first_name, :guardian_type, :household_id, :last_name
end
