class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.integer :program_id
      t.time :start_time
      t.time :end_time
      t.integer :location_id
      t.boolean :gospel_shared
      t.integer :meals_server
      t.integer :bibles_distributed

      t.timestamps
    end
  end
end
