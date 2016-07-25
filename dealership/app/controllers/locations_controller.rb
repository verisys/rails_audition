class LocationsController < ApplicationController
	before_action :find_location, except: [:index, :new, :create]

  def index
  	@locations = Location.all
  end

  def show
  end

  def new
  	@location = Location.new
  end

  def destroy
  	@location.destroy
  	flash[:success] = "Location Removed"
  	redirect_to root_path
  end

  private

  def find_location
  	@location = Location.find(params[:id])
  end
end
