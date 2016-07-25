class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  def new
    @vehicle = Vehicle.new
    @locations = Location.all
  end
  def create
    @vehicle = Vehicle.new(vehicle_params)
    puts @vehicle
    @vehicle.save
    redirect_to @vehicle
  end

  private
    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :price, :location_id)
    end
end
