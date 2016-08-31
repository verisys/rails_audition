class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    !@user.nil?
  end

  def new?
    @user.role == 'owner'
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end
end
