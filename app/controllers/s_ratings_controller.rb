class SRatingsController < ApplicationController
  before_action :get_series_and_rating, only: [:update, :is_owner]
  before_action :is_owner, only: [:update]
  def create
    @ser = Series.find(params[:series_id])
    @rate = Series.find(@ser.seriesID).SRatings.new(rating_params)
    @rate.user_id = current_user.userID
    if @rate.save
      redirect_to @ser
    else
    end
  end
  def update
    if @rate.update_attributes(rating_params)
      redirect_to @ser
    end
  end
  
  def destroy
    @rate.destroy
    redirect_to @ser
  end
  
  private
  def rating_params
    params.require(:s_rating).permit(:rating)
  end
  
  def get_series_and_rating
    @ser = Series.find(params[:series_id])
    @rate = Series.find(@ser.seriesID).SRatings.find(params[:id])
  end
  
  def is_owner
    unless current_user.id == @rate.user_id
    redirect_to @ser
    end
  end
end
