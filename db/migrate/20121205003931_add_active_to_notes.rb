class AddActiveToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :active, :boolean, :default => true
  end
end