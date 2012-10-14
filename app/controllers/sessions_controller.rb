class SessionsController < ApplicationController
  before_filter :require_user, only: [:destroy]
  before_filter :require_no_user, only: [:new, :create]
  
  def new
    # just render
  end
  
  def create
    value = params[:username_or_email].to_s.downcase.strip
    if user = User.where('email = ? OR username = ?', value, value).first.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to shouts_path
    else
      @error = true
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end
end
