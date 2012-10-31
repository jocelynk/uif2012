class CreateSectionEvents < ActiveRecord::Migration
  def change
    create_table :section_events do |t|
      t.integer :section_id
      t.integer :event_id

      t.timestamps
    end
  end
end
