class CreateBuildingLocations < ActiveRecord::Migration
  def self.up
    create_table :building_locations do |t|
      t.string :name
      t.string :php_url
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6

      t.timestamps
    end
  end

  def self.down
    drop_table :building_locations
  end
end
