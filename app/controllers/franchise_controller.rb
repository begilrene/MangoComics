class FranchiseController < ApplicationController
  def new
  end
  def show
    @fran = Franchise.find(params[:id])
  end
end
