require 'csv'
#Artwork.delete_all
#CSV.foreach "lib/Collection results1.csv" do |row|
#  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
# end

t = Tour.create(:name => "Sample Tour")
t.tour_items.create(:artwork => Artwork.find(3696))
t.tour_items.create(:artwork => Artwork.find(3491))
t.tour_items.create(:artwork => Artwork.find(3492))
t.tour_items.create(:artwork => Artwork.find(3504))
t.tour_items.create(:artwork => Artwork.find(3495))

