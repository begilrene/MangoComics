class SeriesController < ApplicationController
  def new
  end
  def show
    @ser = Series.find(params[:id])
    @rating = @ser.SRatings.star(params[:id])
    store_location
  end
end
