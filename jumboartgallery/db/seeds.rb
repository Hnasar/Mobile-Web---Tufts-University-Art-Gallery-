require 'csv'
Artwork.delete_all
CSV.foreach "lib/Collection_results.csv" do |row|
  Artwork.create(:filename => row[0], :object => row[1], :creator => row[2], :title => row[3], :description => row[4], :location => row[5], :recfrom => row[6], :date => row[7])
end