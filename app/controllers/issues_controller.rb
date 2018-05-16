class IssuesController < ApplicationController
  def new
  end
  def show
    @iss = Issue.find(params[:id])
  end
  
  def index
  @iss = Issue.all
  if params[:search]
    @iss = Issue.where(:issueName => params[:search])
  else
    @iss = Issue.all.order("created_at DESC")
  end
  end
end
