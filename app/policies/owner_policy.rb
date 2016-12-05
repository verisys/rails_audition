class OwnerPolicy
  def initialize(user)
    @user = user
  end
  
  def owner?
    @user.owner?
  end
end