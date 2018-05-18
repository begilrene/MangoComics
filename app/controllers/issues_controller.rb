class IssuesController < ApplicationController
  def new
  end
  def show
    @iss = Issue.find(params[:id])
  end
  def index
    redirect_to '/static_pages/comiclist'
  end
  
end
