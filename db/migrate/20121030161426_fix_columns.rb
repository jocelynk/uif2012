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
    
    rename_column :registrations, :team_id, :section_id
    
    add_column :programs, :start_date, :date
    
    add_column :programs, :end_date, :date
    
    rename_table :attendences, :attendances
    
    rename_table :groups, :sections
  end
end
