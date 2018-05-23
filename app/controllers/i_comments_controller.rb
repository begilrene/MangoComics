class ICommentsController < ApplicationController
  before_action :get_issue_and_comment, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy, :edit, :update]
  def create
    @iss = Issue.find(params[:issue_id])
    @comm = Issue.find(@iss.issueID).IComments.new(comment_params)
    @comm.user_id = current_user.userID
    if @comm.save
      redirect_to @iss
    else
    end
  end
  def edit
  end
  def update
    if @comm.update_attributes(comment_params)
      redirect_to @iss
    end
  end
  def destroy
    @comm.destroy
    redirect_to @iss
  end
  private
  def comment_params
    params.require(:i_comment).permit(:body, :user_id)
  end
  def get_issue_and_comment
    @iss = Issue.find(params[:issue_id])
    @comm = Issue.find(@iss.issueID).IComments.find(params[:id])
  end
  def is_owner
    unless current_user.id == @comm.user_id
    redirect_to @iss
    end
  end
end
