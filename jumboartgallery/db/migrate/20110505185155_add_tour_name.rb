class AddTourName < ActiveRecord::Migration
  def self.up
	add_column :tours, :name, :string
  end

  def self.down
	remove_column :tours, :name
  end
end

