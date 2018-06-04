class SreviewsController < ApplicationController
   before_action :get_info, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy, :edit, :update]
  def create
    @ser = Series.find(params[:series_id])
    @review = Series.find(@ser.seriesID).sreviews.new(review_params)
    @review.user_id = current_user.userID
    if @review.save
      redirect_to @ser
    end
  end
  def edit
  end
  def update
    if @review.update_attributes(review_params)
      redirect_to @ser
    end
  end
  
  def index
    @ser = Series.find(params[:series_id])
    @review= Series.find(@ser.seriesID).sreviews.all
    #@vreview= Volume.find(@vol.volumeID).reviews.all
  end
  def destroy
    if @review.destroy
      redirect_to @ser
   
    end
  end
  private
  def review_params
    params.require(:sreview).permit(:body)
  end
  def get_info
    @ser = Series.find(params[:issue_id])
   
    @review = Series.find(@ser.seriesID).reviews.find(params[:id])
  end
  def is_owner
    unless current_user.id == @review.user_id
    redirect_back_or root_url
    end
  end
end
