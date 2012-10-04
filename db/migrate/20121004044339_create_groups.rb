class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :max_capacity
      t.boolean :active

      t.timestamps
    end
  end
end
