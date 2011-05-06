class ToursController < ApplicationController
  
  def index
    @tours = Tour.all
    respond_to do |format|
    	format.html #index.mobile.erb
    end
  end

  # GET /tours/1
  # GET /tours/1.xml
  def show
    @tour = Tour.find(params[:id])
  end

end
