class PublisherController < ApplicationController
  def show
    @pub = Publisher.find(params[:id])
  end
end
