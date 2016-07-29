class VehiclesController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :edit, :sell, :update, :destroy]
  before_action :manager_user,     only: [:new, :edit, :update, :destroy]
  before_action :sales_user,     only: [:sell, :sold]

  
  def new
    @vehicle = Vehicle.new
  end
  
   def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:success] = "Vehicle Added Successfully"
      redirect_to @vehicle
    else
      render 'new'
    end
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
    @vehicles = Vehicle.paginate(page: params[:page])
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  def sell
    @vehicle = Vehicle.find(params[:id])
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    
    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Vehicle Updated"
      redirect_to @vehicle
    else
      render 'edit'
    end
  end
  
  def sold
    @vehicle = Vehicle.find(params[:id])
    
    @vehicle.sold = true
    @vehicle.salesman_id = current_user.id

    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Vehicle Updated"
      redirect_to @vehicle
    else
      render 'sell'
    end
  end
  
  def destroy
    Vehicle.find(params[:id]).destroy
    flash[:success] = "Vehicle Deleted"
    redirect_to current_user
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:location_id, :year, :make, :model, :price, :mpg_city, :mpg_hwy, :color, :stock, :vin, :image_url, :sell_price, :sell_notes)
    end

end
