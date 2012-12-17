class AddDefaultUser < ActiveRecord::Migration
  def up
    profh = User.new
    profh.first_name = "Professor"
    profh.last_name = "Heimann"
    profh.username = "profh"
    profh.email = "profh@cmu.edu"
    profh.password = "secret"
    profh.password_confirmation = "secret"
    profh.role = "admin"
    profh.active = true
    profh.save!
    
    ed = User.new
    ed.first_name = "Ed"
    ed.last_name = "Glover"
    ed.username = "ed.glover"
    ed.email = "edglover@uif.com"
    ed.password = "secret"
    ed.password_confirmation = "secret"
    ed.role = "admin"
    ed.active = true
    ed.save!
  end

  def down
    profh = User.find_by_first_name("Professor")
    prof.destroy
    
    ed = User.find_by_frst_name("Ed")
    ed.destroy
  end
end

