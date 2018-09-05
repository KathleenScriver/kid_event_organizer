class Admin::UserKidsController < Admin::BaseController
  def new
    @kid = Kid.find(params[:kid_id])
    @user_kid = UserKid.new()
    @users = User.all
  end

  def create
    kid = Kid.find(params[:user_kid][:kid_id])
    new_link = UserKid.new(user_kid_params)
    unless new_link.save
      flash.alert = "User could not be saved!"
    end
    redirect_to admin_kid_path(kid)
  end

  def destroy
    kid = Kid.find(params[:kid_id])
    user = User.find(params[:user_id])
    user_kid = UserKid.find_by(user_id: user.id, kid_id: kid.id)
    if user_kid.delete
     flash.notice = "User removed from this kid."
    else
     flash.alert = "Could not remove user, please try again."
    end
    redirect_to admin_kid_path(kid)
  end

  private
    def user_kid_params
      params.require(:user_kid).permit(:user_id, :kid_id)
    end
end
