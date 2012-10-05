class Student < ActiveRecord::Base
  attr_accessible :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :grade, :household_id, :is_male, :last_name, :photo, :status
 
end
