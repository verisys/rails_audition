# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    authorize @locations
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    authorize @location
  end

  # GET /locations/new
  def new
    @location = Location.new
    authorize @location
  end

  # GET /locations/1/edit
  def edit
    authorize @location
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    authorize @location

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    authorize @location

    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    authorize @location

    if @location.vehicles.count > 0
      respond_to do |format|
        format.html { redirect_to locations_url, alert: 'Location not destroyed.  Still has vehicles!' }
        format.json { head :no_content }
      end    else
      @location.destroy
      respond_to do |format|
        format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :street, :city, :state, :zip, :phone)
    end
end
