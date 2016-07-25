class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end
  def show
    @sale = Sale.find(params[:id])
  end
  def new
    @location = Location.find(params[:location_id])
    @vehicle = Vehicle.find(params[:vehicle_id])

    @sale = Sale.new
    @salesmans = Salesman.all
  end
  def create
    @sale = Sale.new(sale_params)
    @sale.save
    redirect_to @sale
  end
  private
    def sale_params
      params.require(:sale).permit(:salesman_id, :price, :vehicle_id)
    end
end
