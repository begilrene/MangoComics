class NewsController < ApplicationController
  before_action :editorpermission, only: [:new,:create,:edit,:update]
  def new
    @newpage = News.new
  end
  def create
    @newpage = News.new(new_params)
    if @newpage.save
      redirect_to @newpage
    else
      render 'new'
    end
  end
  def edit
    @newpage = News.find(params[:id])
  end
  def update
    @newpage = News.find(params[:id])
    if @newpage.update_attributes(new_params)
      redirect_to @newpage
    else
      render 'edit'
    end
  end
  def show
    @newpage = News.find(params[:id])
    store_location
  end
  def index
    redirect_to root_url
  end
  private
  def new_params
      params.require(:news).permit(:title,:author,:body,:image,:link)
  end
end