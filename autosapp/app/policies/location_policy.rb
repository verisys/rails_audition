class LocationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def index?
    !@user.nil? && @user.has_role?(:owner)
  end

  def create?
    !@user.nil? && @user.has_role?(:owner)
  end

  def update?
    !@user.nil? && @user.has_role?(:owner)
  end

  def new?
    !@user.nil? && @user.has_role?(:owner)
  end

  def destroy?
    !@user.nil? && @user.has_role?(:owner)
  end

  def edit?
    !@user.nil? && @user.has_role?(:owner)
  end

  def show?
    !@user.nil? && @user.has_role?(:owner)
  end
end