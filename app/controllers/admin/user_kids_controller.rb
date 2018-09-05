class Admin::UserKidsController < Admin::BaseController
  def destroy
    kid = Kid.find(params[:kid_id])
    user = User.find(params[:user_id])
    user_kid = UserKid.find_by(user_id: user.id, kid_id: kid.id)
    if user_kid.delete
     flash.notice = "User removed."
    else
     flash.alert = "Could not remove user, please try again."
    end
    redirect_to admin_kid_path(kid)
  end
end
