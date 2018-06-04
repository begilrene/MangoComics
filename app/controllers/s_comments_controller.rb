class SCommentsController < ApplicationController
  before_action :get_series_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:edit, :update, :superpermission]
  before_action :superpermission, only: [:destroy]
  
  def create
    @ser = Series.find(params[:series_id])
    @comm = Series.find(@ser.seriesID).SComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @ser
    else
    end
  end
  
  def edit
  end
  
  def update
    if @comm.update_attributes(comment_params)
      redirect_to @ser
    end
  end
  
  def destroy
    @comm.destroy
    redirect_to @ser
  end
  
  private
  def comment_params
    params.require(:s_comment).permit(:body, :user_id, :date)
  end
  
  def get_series_and_comment
    @ser = Series.find(params[:series_id])
    @comm = Series.find(@ser.seriesID).SComments.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @comm.user_id || superpermission
    redirect_to @ser
    end
  end
end
