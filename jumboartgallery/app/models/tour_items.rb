class TourItems < ActiveRecord::Base
  belongs_to :tour
  belongs_to :artwork
end

