class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :student_id
      t.integer :event_id
      t.boolean :exempt

      t.timestamps
    end
  end
end
