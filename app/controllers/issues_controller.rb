class IssuesController < ApplicationController
    @iss = Issue.all
  def new
  end
  def show
    @iss = Issue.find(params[:id])
    @comment = @comm
  end
  private
  def comment_params
      params.permit(:body,:user_id)
  end
  
  def index
  @iss = Issue.all
  if params[:search]
    @iss = Issue.search(params[:search]).order("created_at DESC")
  else
    @iss = Issue.all.order("created_at DESC")
  end
  end
end
