class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :name
      t.string :street
      t.string :street2
      t.string :city
      t.string :zip
      t.string :insurance_company
      t.string :insurance_number
      t.string :church
      t.float :lat
      t.float :lon
      t.boolean :active

      t.timestamps
    end
  end
end
