class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :program_id
      t.integer :max_capacity
      t.boolean :active, :default => true
      
      t.timestamps
    end
  end
end
