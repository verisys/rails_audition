class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # Handles GET calls for /departments
  def index
    @departments = Department.all
  end

  # GET /departments/1
  def show
    @employees = @department.employees
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_department
      @department = Department.find(params[:id])
    end
end
