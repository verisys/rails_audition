class DepartmentsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_dept, except: [:index, :show_users_department, :new, :create]
	
  def index
    redirect_to new_department_path unless current_user.department
    @departments = Department.all
  end

  def show
    @user = User.find(@department.user_id)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create(department_params)
    if @department.save
      current_user.department = @department
      flash[:success] = "Department Created"
      redirect_to root_path
    else
      flash[:danger] = @department.errors.full_messages.join('<br />').html_safe
      render :new
    end
  end

  private 

  def find_dept
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
