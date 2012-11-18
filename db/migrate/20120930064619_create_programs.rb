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
      t.boolean :active

      t.timestamps
    end
  end
end
