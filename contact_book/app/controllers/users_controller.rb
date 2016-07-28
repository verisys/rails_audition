class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_departments

  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:department).all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @department = get_user_department(params[:id])
    @phone_numbers = Phone.where(user_id: params[:id]).pluck(:phone_type, :number).to_h
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.department_id = safe_number(params[:department_id])

    respond_to do |format|
      if @user.save
        set_phone_numbers
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callback to share common ivar
    def set_departments
      @departments = Department.all
    end

    # Get the users department
    def get_user_department(user_id)
      User.find(user_id).department
    end

    # Grab the phone numbers
    def set_phone_numbers
      home_phone = params[:home_phone]
      business_phone = params[:business_phone]
      business_phone_ext = params[:business_phone_ext]
      create_phone_number('Home', home_phone) if home_phone
      create_phone_number('Business', business_phone, business_phone_ext) if business_phone
    end

    # create the phone numbers
    def create_phone_number(phone_type, phone_number, phone_ext = '')
      phone_number = phone_number + ' x' + phone_ext if phone_ext != ''
      Phone.create(phone_type: phone_type, number: phone_number, user_id: @user.id)
    end

    # returns integer type that can be trusted
    def safe_number(untrusted_input)
      untrusted_input.to_i
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :contact_name, :contact_number)
    end
end
