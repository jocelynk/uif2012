class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :barcode_number
      t.integer :household_id
      t.boolean :is_male
      t.integer :grade
      t.date :date_of_birth
      t.string :cell_phone
      t.boolean :can_text
      t.string :photo
      t.string :email
      t.string :status

      t.timestamps
    end
  end
end
