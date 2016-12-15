# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  make        :string
#  model       :string
#  price       :float
#  location_id :integer
#  mpg         :string
#  speed       :string
#  status      :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all.order(:id)
    authorize @vehicles
    @vehicles = @vehicles.to_a.delete_if {|v| !v.sale.nil? }
    @locations = Location.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    authorize @vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  # GET /vehicles/1/edit
  def edit
    authorize @vehicle
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    authorize @vehicle

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    authorize @vehicle

    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    authorize @vehicle

    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_location
    vehicle = Vehicle.find_by_id(params['vehicle_id'])
    authorize vehicle

    location = Location.find_by_id(params['id'])
    unless location.nil?
      vehicle.location_id = location.id
      if vehicle.save
        retval = "Location Updated"
      else
        retval = "Error Updating Location: #{vehicle.errors.messages}"
      end
    else
      retval = "Error Updating Location: Invalid Location Selected"
    end

    render :json => {retval: retval}
  end

  def sell_vehicle
    vehicle = Vehicle.find_by_id(params['vehicle_id'])
    authorize vehicle
    sale_price = params['sale_price'][1..-1].gsub(',','')

    sale = Sale.create(vehicle_id: vehicle.id, user_id: current_user.id, price: sale_price)
    if sale
      vehicle.status = "sold"
      vehicle.save
      if vehicle
        retval = "Vehicle sale made for #{vehicle.make}/#{vehicle.model} for #{sale_price}."
      else
        retval = "ERROR: Vehicle sale made for #{vehicle.make}/#{vehicle.model} for #{sale_price} but status not set to sold (#{vehicle.errors.messages})"
      end
    else
      retval = "Error creating sale: #{sale.errors.messages}"
    end

    render :json => {retval: retval, vehicle_id: vehicle.id}
  end

  def sales_report
    if current_user && (current_user.has_role?(:owner) || current_user.has_role?(:admin))
      @sales = Sale.all
    elsif current_user
      @sales = Sale.where(user_id: current_user.id).order(created_at: :desc)
    else
      @sales = Sale.all  # this will raise exception for authorization
    end
    authorize @sales
    @sales.order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :price, :location_id, :mpg, :speed, :status, :color)
    end
end
