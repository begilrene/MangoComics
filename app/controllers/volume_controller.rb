class VolumeController < ApplicationController
  def new
  end
  def show
    @vol = Volume.find(params[:id])
    @rating = @vol.VRatings.star(params[:id])
    store_location
  end
end
