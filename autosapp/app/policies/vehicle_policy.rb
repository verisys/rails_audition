class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def new?
    return false if @user.nil?

    ['owner', 'inventory_manager'].include? @user.role
  end

  def create?
    new?
  end

  def edit?
    new? && !@record.sold
  end

  def update?
    edit?
  end

  def show?
    true
  end

  def sale?
    return false if @user.nil?

    @user.role == 'salesman' && !@record.sold
  end

  def save_sale?
    sale?
  end
end
