class VolumesController < ApplicationController
  def new
    @vol = Volume.new
  end
  def create
    @vol = Volume.new(volume_params)
    if @vol.save
      redirect_to @vol
    else
      render 'new'
    end
  end
  
  def edit
    @vol = Volume.find(params[:id])
  end
  def show
    @vol = Volume.find(params[:id])
    @rating = @vol.VRatings.star(params[:id])
    @comm = @vol.VComments
    store_location
  end
  private
  def volume_params
     params.require(:volume).permit(:volumename,:series_id)
  end
end
