#require_relative '../policies/owner_policy'
#require_relative '../policies/manager_policy'
#require_relative '../policies/sales_policy'

module ApplicationHelper
  
  def full_title(page_title = '')
    @appl = AutoDealership::App.new()    
    app_name = @appl.name
    if page_title.empty?
      app_name
    else
      page_title + " | " + app_name
    end
  end
  
  def owner?
    OwnerPolicy.new(current_user).owner?
  end

  def manager?
    ManagerPolicy.new(current_user).manager?
  end

  def sales?
    SalesPolicy.new(current_user).sales?
  end

end
