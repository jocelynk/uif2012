class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :student_id
      t.integer :program_id
      t.integer :team_id

      t.timestamps
    end
  end
end
