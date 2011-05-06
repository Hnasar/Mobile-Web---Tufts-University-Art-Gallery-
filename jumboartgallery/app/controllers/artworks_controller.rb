class ArtworksController < ApplicationController
  # GET /artworks
  # GET /artworks.xml
  def index
    @artworks = Artwork.all(:order => 'title ASC')
    @artists = Artwork.select("DISTINCT(creator)").order("creator ASC")
    @types = Artwork.select("DISTINCT(object)").order("object ASC")
    @locations = Artwork.select("DISTINCT(location)").order("location ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artworks }
    end
  end
  
  def view_cat
    @current_cat = "Browsing: " + params[:value]
    @artworks_by_cat = Artwork.where(params[:category] => params[:value]).all(:order => 'title ASC')
    
    respond_to do |format|
      format.html # view_cat.html.erb
    end
  end
	
  def get_art_latlng
 	 @latlng = getlatlng(params[:id])
 	 render :json => @latlng
  end	
	
  # GET /artworks/1
  # GET /artworks/1.xml
  def show
    @artwork = Artwork.find(params[:id])
	@latlng = getlatlng(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artwork }
      format.json { render :json => @latlng }
    end
  end

  # GET /artworks/new
  # GET /artworks/new.xml
  def new
    @artwork = Artwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

  # GET /artworks/1/edit
  def edit
    @artwork = Artwork.find(params[:id])
  end

  # POST /artworks
  # POST /artworks.xml
  def create
    @artwork = Artwork.new(params[:artwork])

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to(@artwork, :notice => 'Artwork was successfully created.') }
        format.xml  { render :xml => @artwork, :status => :created, :location => @artwork }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artworks/1
  # PUT /artworks/1.xml
  def update
    @artwork = Artwork.find(params[:id])

    respond_to do |format|
      if @artwork.update_attributes(params[:artwork])
        format.html { redirect_to(@artwork, :notice => 'Artwork was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.xml
  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy

    respond_to do |format|
      format.html { redirect_to(artworks_url) }
      format.xml  { head :ok }
    end
  end
  
  def getlatlng(id)

  	@last_buildings = Array.new
  	@artwork = Artwork.find(id)
  	@arr_location = @artwork.location.split(", ")[1].split(" ") # [Aidekman, Art, Center]
  	puts @arr_location
  	if not @arr_location.nil?
	  	@arr_location.each do |search_term|
  			@buildings = BuildingLocation.where("name LIKE ?", "%#{search_term}%")
  			if not @buildings.nil? and @buildings.length == 1 # There is one result.
  				return @buildings[0]
	  		elsif not @buildings.nil? and @buildings.length > 1 # There are multiple results.
  				@last_buildings = @buildings
  			elsif not @buildings.nil? and @buildings.length == 0 and @last_buildings.length > 0 #There are no new results.
  				return @last_buildings[0]
  			#elsif @buildings.nil?
  				#puts "buildings is nil"

  			end
  		end
  	end
  	#puts "ret nil"
  	return nil
  end
  
end
