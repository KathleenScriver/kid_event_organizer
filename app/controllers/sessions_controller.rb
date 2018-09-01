class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now.alert = "Incorrect username or password, please try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = "You have successfully logged out."
    redirect_to root_path
  end
end
