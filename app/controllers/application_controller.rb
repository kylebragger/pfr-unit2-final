class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :logged_in?, :require_user, :require_no_user
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    return if logged_in?
    redirect_to login_path and return
  end
  
  def require_no_user
    return unless logged_in?
    redirect_to root_path and return
  end
end
