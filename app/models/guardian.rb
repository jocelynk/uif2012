class Guardian < ActiveRecord::Base
  attr_accessible :active, :can_text, :cell_phone, :email, :first_name, :guardian_type, :household_id, :last_name

  before_save :reformat_phone
  #Relationships
  belongs_to :household
  

  #Validations
  validates_presence_of :first_name, :last_name, :guardian_type, :household_id
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format"
    
  # Callback code
  # -----------------------------
  private
  # We need to strip non-digits before saving to db
  def reformat_phone
    phone = self.phone.to_s # change to string in case input as all numbers
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.phone = phone # reset self.phone to new string
  end
end
