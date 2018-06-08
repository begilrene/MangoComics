class MCommentsController < ApplicationController
  before_action :get_news_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:edit, :update]
  before_action :can_delete, only: [:destroy]
  def create
    @news = News.find(params[:news_id])
    @comm = News.find(@news.newsId).MComments.new(comment_params)
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
    @news = News.find(params[:news_id])
    @comm = News.find(@news.newsId).MComments.find(params[:id])
  end
  def is_owner
    unless current_user.id == @comm.user_id
    redirect_to @new
    end
  end
end
