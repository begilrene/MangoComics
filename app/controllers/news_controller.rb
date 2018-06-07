class NewsController < ApplicationController
  def new
  end
  def show
    @newpage = New.find(params[:id])
  end
  def index
    redirect_to root_url
  end
end