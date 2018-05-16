class VolumesController < ApplicationController
  def new
  end
  def show
    @vol = Volume.find(params[:id])
  end
end
