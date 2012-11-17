class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.integer :household_id
      t.string :guardian_type
      t.string :cell_phone
      t.boolean :can_text
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
