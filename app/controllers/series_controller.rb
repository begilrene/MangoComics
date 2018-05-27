class SeriesController < ApplicationController
  def new
  end
  def show
    @ser = Series.find(params[:id])
    store_location
  end
end
