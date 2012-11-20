=beginclass AddDefaultUser < ActiveRecord::Migration
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
  end

  def down
    profh = User.find_by_first_name("Professor")
    prof.destroy
  end
end
=end
