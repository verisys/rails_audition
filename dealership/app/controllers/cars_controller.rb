class CarsController < ApplicationController
	before_action :find_location
	before_action :find_car, except: [:index, :new, :create]

  def index
  	@cars = @location.cars
  end

  def show
  end

  def new
  	@car = Car.new
  end

  def create
  	@car = @location.cars.create(car_params)
  	if @car.save
  		flash[:success] = "Car Added"
  		redirect_to location_car_path(@location, @car)
  	else
  		flash[:danger] = @car.errors.full_messages.join('<br />').html_safe
  		render :new
  	end
  end
  
  private

  def find_location
  	@location = Location.find(params[:location_id])
  end

  def find_car
  	@car = @location.cars.find(params[:id])
  end

  def car_params
  	params.require(:car).permit(:make, :model, :price, :year, :mileage, :sold)
  end
end
