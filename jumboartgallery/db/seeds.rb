require 'csv'

Artwork.delete_all

csv_contents = CSV.read("lib/Collection_results.csv")
csv_contents.shift
csv_contents.each do |row|
  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
end

#BuildingLocation.delete_all
#CSV.foreach "lib/all_historic_locations.csv" do |row|
#  BuildingLocation.create(:name => row[0], :php_url => row[1], :lat => row[2], :lng => row[3])
#end


t = Tour.create(:name => "Sample Tour")
#t.tour_items.create(:artwork => Artwork.find(3491))
#t.tour_items.create(:artwork => Artwork.find(3499))
#t.tour_items.create(:artwork => Artwork.find(3525))
#t.tour_items.create(:artwork => Artwork.where(:title => 'Greek Lekythos').id)
#t.tour_items.create(:artwork => Artwork.where(:title => 'Shoe Shine Sign in Southern Town').id)

