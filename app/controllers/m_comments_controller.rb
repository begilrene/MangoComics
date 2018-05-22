class MCommentsController < ApplicationController
  def create
    @news = New.find(params[:news_id])
    @comm = New.find(@news.newsId).MComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @news
    else
    end
  end
  def comment_params
    params.require(:m_comment).permit(:body, :user_id)
  end
end
