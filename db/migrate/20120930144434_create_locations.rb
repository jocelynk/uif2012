class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.float :lat
      t.float :lon
      t.boolean :active

      t.timestamps
    end
  end
end
