class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def update
    @location.update(location_params)
    redirect_to locations_url notice: 'Location successfully updated'
  end

  def destroy
    @location.destroy
    redirect_to locations_url , notice: 'Location Successfully Deleted'
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to locations_url, notice: 'Location Successfully Created'
  end

  private
    def location_params
      params.require(:location).permit(:name)
    end

    def set_location
      @location = Location.find(params[:id])
    end

end
