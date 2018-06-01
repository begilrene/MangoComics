class IRatingsController < ApplicationController
  before_action :get_issue_and_rating, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy ,:update]
  def create
    @iss = Issue.find(params[:issue_id])
    @rate = Issue.find(@iss.issueID).IRatings.new(rating_params)
    @rate.user_id = current_user.userID
    if @rate.save
      redirect_to @iss
    else
    end
  end
  def update
    if @rate.update_attributes(rating_params)
      redirect_to @iss
    end
  end
  
  def destroy
    @rate.destroy
    redirect_to @iss
  end
  
  private
  def rating_params
    params.require(:i_rating).permit(:rating)
  end
  
  def get_issue_and_rating
    @iss = Issue.find(params[:issue_id])
    @rate = Issue.find(@iss.issueID).IRatings.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @rate.user_id
    redirect_to @iss
    end
  end
end
