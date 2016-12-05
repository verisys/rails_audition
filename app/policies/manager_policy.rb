class ManagerPolicy
  def initialize(user)
    @user = user
  end
  
  def manager?
    @user.manager?
  end
end