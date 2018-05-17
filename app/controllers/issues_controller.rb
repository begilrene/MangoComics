class IssuesController < ApplicationController
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
end
