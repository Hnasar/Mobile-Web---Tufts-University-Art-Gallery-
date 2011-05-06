class Tour < ActiveRecord::Base
  validates_presence_of :name
  has_many :tour_items
  has_many :artwork, :through => :tour_items
end
