class IssuesController < ApplicationController
  before_action :editorpermission, only: [:new,:create,:edit,:update]
  def new
    @iss = Issue.new
  end
  def create
    @iss = Issue.new(issue_params)
    if @iss.save
      redirect_to @iss
    else
      render 'new'
    end
  end
  
  def edit
    @iss = Issue.find(params[:id])
  end
  def show
    @iss = Issue.find(params[:id])
    @rating = @iss.IRatings.star(params[:id])
    store_location
    @comm = @iss.IComments
  end
  def update
    @iss = Issue.find(params[:id])
    if @iss.update_attributes(issue_params)
      redirect_to @iss
    else
      render 'edit'
    end
  end
  
  def index
  @iss = Issue.all
  if params[:search]
    @iss = Issue.search(params[:search])
  else
    @iss = Issue.all
  end
  end

  private
  def issue_params
      params.require(:issue).permit(:issuename,:cover,:synopsis,:summary,:artist,:author,:editor,:characters,:tags,:volume_id)
  end
end
