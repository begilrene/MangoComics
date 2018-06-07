class FlistsController < ApplicationController
  def create
    @add = current_user.flists.new(list_params)
    if @add.save
      redirect_back_or root_url
    else
    end
  end
  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.flists.where('followid = ?',@user.userID).first
    @follow.destroy
    redirect_to @user
  end
  private
  def list_params
    params.permit(:userid,:followid)
  end
end
