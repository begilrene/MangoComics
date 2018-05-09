class IssuesController < ApplicationController
  def new
  end
  def show
    @iss = Issue.find(params[:id])
  end
end
