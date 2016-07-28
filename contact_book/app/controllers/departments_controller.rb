class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
  end

  private

    # Use callbacks to share common setup or constraints between actions
    def set_department
      @department = Department.find(params[:id])
    end
end
