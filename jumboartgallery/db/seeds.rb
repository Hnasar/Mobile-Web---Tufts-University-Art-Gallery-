require 'csv'

Artwork.delete_all
CSV.foreach "lib/Collection_results.csv" do |row|
  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
end

BuildingLocation.delete_all
CSV.foreach "lib/all_historic_locations.csv" do |row|
  BuildingLocation.create(:name => row[0], :php_url => row[1], :lat => row[2], :lng => row[3])
end

Tour.delete_all
t = Tour.create(:name => "Sample Tour")
#t.tour_items.create(:artwork => Artwork.find(3696))
#t.tour_items.create(:artwork => Artwork.find(3491))
#t.tour_items.create(:artwork => Artwork.find(3492))
#t.tour_items.create(:artwork => Artwork.find(3504))
#t.tour_items.create(:artwork => Artwork.find(3495))

