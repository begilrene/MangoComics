class IssuesController < ApplicationController
  def new
  end
  
  def show
    @iss = Issue.find(params[:id])
    @rating = @iss.IRatings.star(params[:id])
    store_location
    @comment = @comm
  end
  
  def index
  @iss = Issue.all
  if params[:search]
    @iss = Issue.search(params[:search])
  else
    @iss = Issue.all
  end
  end

  private
  def comment_params
      params.permit(:body,:user_id)
  end
end
