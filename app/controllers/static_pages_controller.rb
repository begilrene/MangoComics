class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @comics = Issue.all
   # p = User.new
   # String hmm = ('a'..'z').to_a.shuffle[0..7].join
   # p.username = hmm
   # render html: p.username
  end
 
  def comiclist
    @users = User.all
    @iss = Issue.all
    #render html: "layouts/parti#partial: 'layouts/front',layouts: 'layouts/front'
  end
  def help
    @users = User.all
    @comics = Issue.all
    #render html: "layouts/parti#partial: 'layouts/front',layouts: 'layouts/front'
  end
  
  def about
  end
  
  def contact
  end
  
  def index
    @iss = Issue.all
  if params[:search]
    @iss = Issue.search(params[:search])
  else  
    @iss = Issue.paginate(:page => params[:page], :per_page => 50).order("created_at DESC")
  end  


  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @iss }
    # format.js
  end
  end
end
