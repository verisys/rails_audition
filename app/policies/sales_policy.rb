class SalesPolicy
  def initialize(user)
    @user = user
  end
  
  def sales?
    @user.salesman?
  end
end