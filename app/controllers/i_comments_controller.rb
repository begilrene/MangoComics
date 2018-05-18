class ICommentsController < ApplicationController
  def create
    @iss = Issue.find(params[:issue_id])
    @comm = Issue.find(@iss.issueID).IComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @iss
    else
    end
  end
  def comment_params
    params.require(:i_comment).permit(:body, :user_id)
  end
end
