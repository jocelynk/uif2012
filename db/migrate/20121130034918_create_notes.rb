class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.date :date
      t.text :contents
      t.string :notable_type
      t.integer :notable_id
      t.integer :priority

      t.timestamps
    end
  end
end
