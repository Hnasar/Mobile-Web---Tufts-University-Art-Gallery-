require 'csv'

Artwork.delete_all
FasterCSV.foreach("lib/Collection_results.csv", :headers => true) do |row|
  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
end

#BuildingLocation.delete_all
#CSV.foreach "lib/all_historic_locations.csv" do |row|
#  BuildingLocation.create(:name => row[0], :php_url => row[1], :lat => row[2], :lng => row[3])
#end
