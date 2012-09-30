class FixColumns < ActiveRecord::Migration
  def change
    rename_column :events, :meal_server, :meal_served
  end
end
