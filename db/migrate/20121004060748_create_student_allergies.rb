class CreateStudentAllergies < ActiveRecord::Migration
  def change
    create_table :student_allergies do |t|
      t.integer :student_id
      t.integer :allergy_id

      t.timestamps
    end
  end
end
