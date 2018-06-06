class FranchiseController < ApplicationController
  
  def show
    @fran = Franchise.find(params[:id])
  end
end
