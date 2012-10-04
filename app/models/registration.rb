class Registration < ActiveRecord::Base
  attr_accessible :program_id, :student_id, :team_id

  #Relationships
  belongs_to :team
  belongs_to :program
#need to create student table
  
end
