class Artwork < ActiveRecord::Base
  has_many :tour_items
  has_many :tour, :through => :tour_items
end
