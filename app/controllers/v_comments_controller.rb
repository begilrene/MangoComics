class VCommentsController < ApplicationController
  before_action :get_volume_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:edit, :update, :superpermission]
  before_action :superpermission, only: [:destroy]
  
  def create
    @vol = Volume.find(params[:volume_id])
    @comm = Volume.find(@vol.volumeID).VComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @vol
    else
    end
  end
  
  def edit
  end
  
  def update
    if @comm.update_attributes(comment_params)
      redirect_to @vol
    end
  end
  
  def destroy
    @comm.destroy
    redirect_to @vol
  end
  
  private
  def comment_params
    params.require(:v_comment).permit(:body, :user_id, :date)
  end
  
  def get_issue_and_comment
    @vol = Volume.find(params[:volume_id])
    @comm = Volume.find(@vol.volumeID).VComments.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @comm.user_id || superpermission
    redirect_to @vol
    end
  end
end
