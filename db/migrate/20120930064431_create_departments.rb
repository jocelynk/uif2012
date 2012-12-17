class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
