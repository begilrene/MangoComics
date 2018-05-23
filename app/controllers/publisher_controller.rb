class PublisherController < ApplicationController
  def new
  end
  def show
    @pub = Publisher.find(params[:id])
  end
end
