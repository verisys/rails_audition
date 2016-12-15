class LocationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def index?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def create?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def update?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def new?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def destroy?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def edit?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end

  def show?
    !@user.nil? && (@user.has_role?(:owner) || (@user.has_role?(:admin)))
  end
end