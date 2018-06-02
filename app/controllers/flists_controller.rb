class FlistsController < ApplicationController
  before_action :is_owner, only: [:destroy]
  def create
    @user = User.find(params[:user_id])
    @add = @user.flists.new(list_params)
    @add.user_id = @user.userID
    @add.followid = current_user.userID
    if @add.save
      redirect_back_or root_url
    else
    end
  end
  def destroy
    @user = User.find(params[:user_id])
    @follow = @user.flists.find(params[:id])
    @follow.destroy
    redirect_to @user
  end
  private
  def list_params
    params.permit(:userid,:followid)
  end
  def is_owner
    @user = User.find(params[:user_id])
    @relation = @user.flists.where(user_id: @user.userID,followid: current_user.userID).first()
    unless current_user.id == @relation.user_id
    end
  end
end
