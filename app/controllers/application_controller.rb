class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_admin
    redirect_to '/' unless current_user
  end
end
