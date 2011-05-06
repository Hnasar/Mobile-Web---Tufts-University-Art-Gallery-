class CreateTourItems < ActiveRecord::Migration
  def self.up
    create_table :tour_items do |t|
      t.integer :artwork_id
      t.integer :tour_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :tour_items
  end
end
