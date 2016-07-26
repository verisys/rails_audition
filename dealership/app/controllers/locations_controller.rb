class LocationsController < ApplicationController
  before_action :authenticate_user!
	before_action :find_location, except: [:index, :new, :create]

  def index
  	@locations = Location.all
  end

  def show
  end

  def new
  	@location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location Added"
      redirect_to locations_path
    else
      flash[:danger] = @location.errors.full_messages.join('<br />').html_safe
      render :new
    end
  end

  def destroy
  	@location.destroy
  	flash[:success] = "Location Removed"
  	redirect_to locations_path
  end

  private

  def find_location
  	@location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:address_line_1, :address_line_2, :city, :state, :zip_code)
  end

end
