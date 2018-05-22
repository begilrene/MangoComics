class NewsController < ApplicationController
  def new
  end
  def show
    @newpage = New.find(params[:id])
    @comment = @comm
  end
  def index
    redirect_to '/static_pages/comiclist'
  end
end