class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.text :desc
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :tours
  end
end
