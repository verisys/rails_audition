class VehiclePolicy
  attr_reader :user, :vehicle

  def initialize(user, vehicle)
    @user = user
    @vehicle = vehicle
  end

  def index?
    !@user.nil? && (@user.has_role?(:inventory) || @user.has_role?(:sales))
  end

  def create?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def update?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def new?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def destroy?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def edit?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def show?
    !@user.nil? && (@user.has_role?(:inventory) || @user.has_role?(:sales))
  end

  def update_location?
    !@user.nil? && @user.has_role?(:inventory)
  end

  def sell_vehicle?
    !@user.nil? && @user.has_role?(:sales)
  end
end