class SeriesController < ApplicationController
  def new
    @ser = Series.new
  end
  def create
    @ser = Series.new(series_params)
    if @ser.save
      redirect_to @ser
    else
      render 'new'
    end
  end
  
  def edit
    @ser = Series.find(params[:id])
  end
  def show
    @ser = Series.find(params[:id])
    @rating = @ser.SRatings.star(params[:id])
    @comm = @ser.SComments
    store_location
  end
  private
  def series_params
     params.require(:series).permit(:seriesname,:picture,:franchise_id)
  end
end
