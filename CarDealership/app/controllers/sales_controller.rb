class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :sales_only
  before_action :set_sale, only: [:show]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sales_users = User.where(role: [User.roles[:owner], User.roles[:salesman]])
    @available_vehicles = Vehicle.where.not(id: Sale.where.not(vehicle_id: nil).pluck(:vehicle_id))
    #byebug    
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    
    if current_user.salesman?
      @sale.user_id = current_user.id
    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :sale_price, :sale_price, :vehicle_id)
    end
    
    def sales_only
      unless current_user.owner? or current_user.salesman?
        redirect_to "/", :alert => "Access denied."
      end
    end
end
