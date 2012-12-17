class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :role
      t.integer :department_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end