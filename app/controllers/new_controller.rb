class NewController < ApplicationController
  def new
  end
  def show
    @new = New.find(params[:id])
  end
  def index
    redirect_to '/static_pages/comiclist'
  end
end