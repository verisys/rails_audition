class CarsController < ApplicationController
	before_action :find_location, except: [:all_cars]
	before_action :find_car, except: [:index, :all_cars, :new, :create, :sell]

  def index
  	@cars = @location.cars
  end

  def all_cars
    @cars = Car.all
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

  def edit
    @locations = Location.all
  end

  def sell
    @car = Car.find(params[:car_id])
  end

  def update
    if params[:car][:sale_price]
      @car.update(sold: true, sale_price: params[:car][:sale_price], salesman_id: current_user.id)
      flash[:success] = "Congrats on the sale!"
      redirect_to location_car_path(@location, @car)
    else
      new_location_id = params[:car][:location]
      @car.update(location_id: new_location_id)
      flash[:success] = "Car Moved"
      redirect_to location_car_path(location_id: new_location_id, id: @car.id)
    end
  end

  def destroy
    @car.delete
    flash[:success] = "Car Removed"
    redirect_to location_cars_path(@location)
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
