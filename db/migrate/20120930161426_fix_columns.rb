class FixColumns < ActiveRecord::Migration
  def change
    #rename column
    rename_column :events, :meals_server, :meals_served
    #change datetime to date
    change_column :events, :date, :date #change_column :your_table, :your_column, :type
    #removes duplicate active columns
    remove_column :programs, :active 
    #adds column back in
    add_column :programs, :active, :boolean
    
    rename_column :registrations, :team_id, :group_id
  end
end
