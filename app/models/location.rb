class Location < ActiveRecord::Base
  attr_accessible :active, :city, :lat, :lon, :name, :street, :zip

  before_save :reformat_phone

  #Relationships
  has_many :events
  has_many :programs, :through => :events

  #Validations
  validates_presence_of :name, :street, :city, :active
  validates_uniqueness_of :name
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long"
  validates_numericality_of :lat, :lon, :allow_blank => true
  # Scopes
  scope :alphabetical, order('name')
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)

end

  # Callback code
  private
  # We need to strip non-digits before saving to db
  def reformat_phone
    phone = self.phone.to_s # change to string in case input as all numbers
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.phone = phone # reset self.phone to new string
  end
