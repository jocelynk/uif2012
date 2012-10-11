class Allergy < ActiveRecord::Base
  attr_accessible :active, :name, :warning_text
end
