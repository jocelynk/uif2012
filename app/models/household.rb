class Household < ActiveRecord::Base
  attr_accessible :active, :church, :city, :insurance_company, :insurance_number, :lat, :lon, :name, :street, :street2, :zip
end
