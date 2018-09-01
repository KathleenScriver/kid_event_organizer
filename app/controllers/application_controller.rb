class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    flash.alert = "You must be logged in to access this page." if current_user.nil?
    redirect_to login_path
  end
end
