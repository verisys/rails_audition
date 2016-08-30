class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @cars = Car.all
  end

  def destroy
    @car.destroy
    redirect_to cars_url notice: 'Car Successfully Deleted'
  end

  def show
  end

  def update
    cp = car_params
    if cp[:sell_price] != 0 and cp[:sell_price] != '' and cp[:sell_price] != nil
      cp[:sold] = true
    else
      cp[:sold] = false
    end
    @car.update(cp)
    redirect_to cars_url notice: 'Car Successfully Updated'
  end

  def create
    @car = Car.new(car_params)
    if @car.sell_price != 0 and @car.sell_price != nil
      @car.sold = true
    else
      @car.sold = false
    end
    @car.save
    redirect_to cars_url notice: 'Car Successfully Created'
  end

  def new
    @car = Car.new
  end

  private
    def car_params
      params.require(:car).permit(:make, :model, :location_id, :price, :sell_price, :sold)
    end

    def set_car
      @car = Car.find(params[:id])
    end

end
