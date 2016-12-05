class LocationsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @locations = LocationQuery.new.paginate(page: params[:page])
  end
 
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location successfully added"
      redirect_to locations_url
    else
      render 'new'
    end
  end
  
  def show
    @location = Location.find(params[:id])
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @user = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location updated"
      redirect_to @location
    else
      render 'edit'
    end
  end
  
  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to locations_url
  end

  private

    def location_params
      params.require(:location).permit(:name, :address, :city, :state, :zip)
    end

end
