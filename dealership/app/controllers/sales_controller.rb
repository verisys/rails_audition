class SalesController < ApplicationController
  # prepare sale class dependencies
  def selling
    @sale = Sale.new
    @vehicle = Vehicle.find(params[:vehicle].to_i)
  end

  def sale_complete
    vehicle = Vehicle.find(params[:sale][:vehicle_id])

    sale = Sale.new(vehicle_id: vehicle.id, user_id: current_user.id, price: params[:sale][:price])

    if sale.save
      vehicle.sold = true
      vehicle.save
      flash.now[:success] = 'Sale Completed Successfully'
    else
      flash.now[:danger] = 'Sale Not Completed'
    end
    redirect_to vehicles_path
  end

end
