class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account successfully created!"
      redirect_to user_path(@user)
    else
      flash.now.alert = "Account not created. Please make sure you have a valid
      username and password."
      render :new
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :title, :username, :password)
    end
end
