class SeriesController < ApplicationController
  def new
  end
  def show
    @ser = Series.find(params[:id])
  end
end
