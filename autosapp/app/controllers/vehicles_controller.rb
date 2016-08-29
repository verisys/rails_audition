class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:sale, :save_sale, :show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all.order('sold ASC')

    authorize @vehicles
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

  # GET /vehicles/1/sale
  def sale
    authorize @vehicle
  end

  # PATCH /vehicles/1/save_sale
  def save_sale
    authorize @vehicle

    @vehicle.sold = true
    @vehicle.sale_price = vehicle_params["sale_price"]
    @vehicle.salesman_user_id = current_user.id

    if @vehicle.save
      redirect_to vehicle_path @vehicle, notice: "The vehicle has been sold!"
    else
      render :sale
    end
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
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:location_id, :year, :make, :model, :price, :sold, :sale_price)
    end
end
