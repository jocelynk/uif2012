class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.integer :student_id
      t.integer :event_id
      t.boolean :exempt

      t.timestamps
    end
  end
end
