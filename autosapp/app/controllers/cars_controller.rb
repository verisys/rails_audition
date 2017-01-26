class CarsController < ApplicationController
  before_action :set_car, only: [:destroy, :edit, :show, :update]
  before_action :set_location, only: [:index, :new, :create, :show]

  def all_cars
    @cars = ::Car.all
    render 'index'
  end

  def create
    car = ::Car.new(car_params)
    if car.save
      flash[:success] = 'Successfully created a new car.'
      redirect_to all_cars_path
    else
      flash[:error] = 'Could not create car.'
      render 'new'
    end
  end

  def destroy
    @car.destroy
    redirect_to location_cars_path(params[:location_id])
  end

  def edit
    @locations = ::Location.all.map { |location| [location.name, location.id] }
  end

  def index
    @cars = ::Car.all
  end

  def new
    @car = ::Car.new
  end

  def show
  end

  def update
    @location = ::Location.find(params[:location_id])
    @car = @location.cars.find(params[:id])
    if @car.update(car_params)
      redirect_to all_cars_path
    else
      flash[:error] = 'Could not update car.'
      render 'edit'
    end
  end

  private

  def car_params
    params.require(:car).permit(:location_id, :make, :model, :price, :sold, :sold_by, :sold_price)
  end

  def set_car
    set_location
    @car = @location.cars.find(params[:id])
  end

  def set_location
    @location = ::Location.find(params[:location_id])
  end

end
