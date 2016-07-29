class Dashboard
  attr_reader :user, :vehicles
  
  def initialize(user, vehicles)
    @user = user
    @vehicles = vehicles
  end
  
  def title
    user.name
  end
  
  def gravatar
    gravatar_for user
  end
end