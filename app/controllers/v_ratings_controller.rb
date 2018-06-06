class VRatingsController < ApplicationController
  before_action :get_volume_and_rating, only: [:update, :is_owner]
  before_action :is_owner, only: [:update]
  def create
    @volume = Volume.find(params[:volume_id])
    @rate = Volume.find(@volume.volumeID).VRatings.new(rating_params)
    @rate.user_id = current_user.userID
    if @rate.save
      redirect_to @volume
    else
    end
  end
  def update
    if @rate.update_attributes(rating_params)
      redirect_to @volume
    end
  end
  
  def destroy
    @rate.destroy
    redirect_to @volume
  end
  
  private
  def rating_params
    params.require(:v_rating).permit(:rating)
  end
  
  def get_volume_and_rating
    @volume = Volume.find(params[:volume_id])
    @rate = Volume.find(@volume.volumeID).VRatings.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @rate.user_id
    redirect_to @volume
    end
  end
end
