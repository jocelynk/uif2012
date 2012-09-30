class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :active
      t.integer :max_capacity

      t.timestamps
    end
  end
end
