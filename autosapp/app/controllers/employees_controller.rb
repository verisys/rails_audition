class EmployeesController < ApplicationController
  before_action :set_employee, only: [:destroy, :edit, :show, :update]
  before_action :set_location, only: [:index]

  def all_employees
    @employees = ::Employee.all
    render 'index'
  end

  def create
    employee = ::Employee.new(employee_params)
    if employee.save
      flash[:success] = 'Successfully created a new employee.'
    else
      flash[:error] = 'Could not create employee.'
    end
    redirect_to location_employee_path(params[:location_id])
  end

  def destroy
    @employee.destroy
    redirect_to location_employee_path(params[:location_id])
  end

  def edit
  end

  def index
    @employees = ::Employee.all
  end

  def new
    @employee = ::Employee.new
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      redirect_to location_employee_path(@location.id, @employee.id)
    else
      flash[:error] = 'Could not update employee.'
      render 'edit'
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:location_id, :name, :role)
  end

  def set_employee
    @employee = @location.employees.find(params[:id])
  end

  def set_location
    @location = ::Location.find(params[:location_id])
  end
end
