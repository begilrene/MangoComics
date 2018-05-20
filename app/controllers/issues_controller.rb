class IssuesController < ApplicationController
  def new
  end
  def show
    @iss = Issue.find(params[:id])
    @comment = @comm
  end
<<<<<<< HEAD
  
  def index
  @iss = Issue.all
  if params[:search]
    @iss = Issue.where(:issueName => params[:search])
  else
    @iss = Issue.all.order("created_at DESC")
  end
  end
=======
  private
  def comment_params
      params.permit(:body,:user_id)
  end
  def index
    redirect_to '/static_pages/comiclist'
  end
  
>>>>>>> origin/master
end
