class MCommentsController < ApplicationController
  before_action :get_news_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy, :edit, :update]
  def create
    @news = New.find(params[:news_id])
    @comm = New.find(@news.newsId).MComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @news
    else
    end
  end
  def edit
  end
  def update
    if @comm.update_attributes(comment_params)
      redirect_to @news
    end
  end
  def destroy
    @comm.destroy
    redirect_to @news
  end
  private
  def comment_params
    params.require(:m_comment).permit(:body, :user_id)
  end
  def get_news_and_comment
    @news = New.find(params[:news_id])
    @comm = New.find(@news.newsId).MComments.find(params[:id])
  end
  def is_owner
    unless current_user.id == @comm.user_id || current_user.permission > 1
    redirect_to @new
    end
  end
end
