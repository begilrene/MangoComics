class UCommentsController < ApplicationController
  before_action :get_issue_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:edit, :update, :superpermission]
  before_action :superpermission, only: [:destroy]
  def create
    @wall = User.find(params[:user_id])
    @comm = User.find(@wall.userID).UComments.new(comment_params)
    @comm.user_id = current_user.userID
    @comm.wall_id = params[:user_id]
    if @comm.save
      redirect_to @wall
    else
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @comm = @user.UComments.find(params[:id])
  end
  
  def update
    if @comm.update_attributes(comment_params)
      redirect_to @wall
    end
  end
  
  def destroy
    @comm.destroy
    redirect_to @wall
  end
  
  private
  def comment_params
    params.require(:u_comment).permit(:body)
  end
  
  def get_issue_and_comment
    @wall = User.find(params[:user_id])
    @comm = User.find(@wall.userID).UComments.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @comm.user_id || current_user.permission.to_i > 0
    redirect_to @wall
    end
  end
  
end
