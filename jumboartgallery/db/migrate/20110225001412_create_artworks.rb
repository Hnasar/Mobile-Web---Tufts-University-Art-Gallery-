class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.string :object
      t.string :creator
      t.string :title
      t.text :description
      t.text :location
      t.string :recfrom
      t.date :date
      t.string :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :artworks
  end
end
