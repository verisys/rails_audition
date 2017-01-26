class LocationsController < ApplicationController
  before_action :set_location, only: [:destroy, :edit, :show, :update]

  def create
    location = ::Location.new(location_params)
    if location.save
      flash[:success] = 'Successfully created a new location.'
    else
      flash[:error] = 'Could not create location.'
    end
    redirect_to locations_path
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  def edit
  end

  def index
    @locations = ::Location.all
  end

  def new
    @location = ::Location.new
  end

  def show
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location.id)
    else
      flash[:error] = 'Could not update location.'
      render 'edit'
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :street_address, :city, :state, :zip_code)
  end

  def set_location
    @location = ::Location.find(params[:id])
  end

end
