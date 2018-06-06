class VreviewsController < ApplicationController
  before_action :get_info, only: [:destroy, :edit, :update, :is_owner]
  before_action :is_owner, only: [:destroy, :edit, :update]
  def create
    @volume = Volume.find(params[:volume_id])
    @review = Volume.find(@volume.volumeID).vreviews.new(review_params)
    @review.user_id = current_user.userID
    if @review.save
      redirect_to @volume
    end
  end
  def edit
  end
  def update
    if @review.update_attributes(review_params)
      redirect_to @volume
   
    end
  end
  def index
    @vol = Volume.find(params[:volume_id])
    @review= Volume.find(@vol.volumeID).vreviews.all
    #@vreview= Volume.find(@vol.volumeID).reviews.all
  end
  def destroy
    if @review.destroy
      redirect_to @volume
   
    end
  end
  private
  def review_params
    params.require(:vreview).permit(:body)
  end
  def get_info
    @volume = Volume.find(params[:volume_id])
   
    @review = Volume.find(@volume.volumeID).vreviews.find(params[:id])
  end
  def is_owner
    unless current_user.id == @review.user_id
    redirect_back_or root_url
    end
  end
end
