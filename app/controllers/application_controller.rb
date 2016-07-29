require 'auto_dealership'

class ApplicationController < ActionController::Base
  before_action :load_defaults
  
  protect_from_forgery with: :exception
  
  
  include SessionsHelper
    
  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
    def load_defaults
      @appl = AutoDealership::App.new()
    end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
    def owner_user
      redirect_to(root_url) unless current_user.owner?
    end
  
    def manager_user
      redirect_to(root_url) unless current_user.manager?
    end
  
    def sales_user
      redirect_to(root_url) unless current_user.salesman?
    end
  
end
