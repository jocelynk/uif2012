class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :department_id
      t.integer :min_grade
      t.integer :max_grade
      t.boolean :active
      t.integer :max_capacity
      t.date :start_date
      t.date :end_date
      t.boolean :scan_by_absence, :default => false

      t.timestamps
    end
  end
end
