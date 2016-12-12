class SalePolicy
  attr_reader :user, :sale

  def initialize(user, sale)
    @user = user
    @sale = sale
  end

  def sales_report?
    true
  end
end

