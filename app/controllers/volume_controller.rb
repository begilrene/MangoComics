class VolumeController < ApplicationController
  def new
  end
  def show
    @vol = Volume.find(params[:id])
    @rating = @vol.VRatings.star(params[:id])
    @comm = @vol.VComments
    store_location
  end
end
