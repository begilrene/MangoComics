class ReviewsController < ApplicationController
  before_action :get_info, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy, :edit, :update]
  def create
    @iss = Issue.find(params[:issue_id])
    @review = Issue.find(@iss.issueID).reviews.new(review_params)
    @review.user_id = current_user.userID
    if @review.save
      redirect_to @iss
    end
  end
  
  def show
    @iss = Issue.find(params[:issue_id])
    @review = Review.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @irev.update_attributes(review_params)
      redirect_to @iss
   
    end
  end
  
  def destroy
    if @irev.destroy
      redirect_to @iss
   
    end
  end
  private
  def review_params
    params.require(:review).permit(:body)
  end
  def get_info
    @iss = Issue.find(params[:issue_id])
   
    @irev = Issue.find(@iss.issueID).reviews.find(params[:id])
  end
  def is_owner
    unless current_user.id == @irev.user_id
    redirect_back_or root_url
    end
  end
end
