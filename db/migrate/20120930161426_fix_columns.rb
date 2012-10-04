class FixColumns < ActiveRecord::Migration
  def change
    rename_column :events, :meals_server, :meals_served
    change_column :events, :date, :date
  end
end
