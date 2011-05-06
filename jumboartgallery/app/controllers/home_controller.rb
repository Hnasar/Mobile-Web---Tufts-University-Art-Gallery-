class HomeController < ApplicationController
  
  def index
  	
  	@random_art = Artwork.find(:all, :offset => (Artwork.count * rand).to_i, :limit => 1)	
  	
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
