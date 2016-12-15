class SalePolicy
  attr_reader :user, :sale

  def initialize(user, sale)
    @user = user
    @sale = sale
  end

  def sales_report?
    @user && (@user.has_role?(:owner) || @user.has_role?(:sales) || (@user.has_role?(:admin)))
  end
end

