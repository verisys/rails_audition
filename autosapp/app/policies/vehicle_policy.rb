class VehiclePolicy
  attr_reader :user, :vehicle

  def initialize(user, vehicle)
    @user = user
    @vehicle = vehicle
  end

  def index?
    !@user.nil? && (@user.has_role?(:inventory) || @user.has_role?(:sales) || (@user.has_role?(:admin)))
  end

  def create?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def update?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def new?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def destroy?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def edit?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def show?
    !@user.nil? && (@user.has_role?(:inventory) || @user.has_role?(:sales) || (@user.has_role?(:admin)))
  end

  def update_location?
    !@user.nil? && (@user.has_role?(:inventory) || (@user.has_role?(:admin)))
  end

  def sell_vehicle?
    !@user.nil? && (@user.has_role?(:sales) || (@user.has_role?(:admin)))
  end
end