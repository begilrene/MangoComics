class VolumeController < ApplicationController
  def new
  end
  def show
    @vol = Volume.find(params[:id])
    store_location
  end
end
