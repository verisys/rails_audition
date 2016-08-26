class CarDetailsController < ApplicationController
  before_action :set_car_detail, only: [:show, :edit, :update, :destroy]

  # GET /car_details
  # GET /car_details.json
  def index
    @car_details = CarDetail.all
  end

  # GET /car_details/1
  # GET /car_details/1.json
  def show
  end

  # GET /car_details/new
  def new
    @car_detail = CarDetail.new
  end

  # GET /car_details/1/edit
  def edit
  end

  # POST /car_details
  # POST /car_details.json
  def create
    @car_detail = CarDetail.new(car_detail_params)

    respond_to do |format|
      if @car_detail.save
        format.html { redirect_to @car_detail, notice: 'Car detail was successfully created.' }
        format.json { render :show, status: :created, location: @car_detail }
      else
        format.html { render :new }
        format.json { render json: @car_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_details/1
  # PATCH/PUT /car_details/1.json
  def update
    respond_to do |format|
      if @car_detail.update(car_detail_params)
        format.html { redirect_to @car_detail, notice: 'Car detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_detail }
      else
        format.html { render :edit }
        format.json { render json: @car_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_details/1
  # DELETE /car_details/1.json
  def destroy
    @car_detail.destroy
    respond_to do |format|
      format.html { redirect_to car_details_url, notice: 'Car detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_detail
      @car_detail = CarDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_detail_params
      params.require(:car_detail).permit(:year, :make, :model, :engine, :color)
    end
end
