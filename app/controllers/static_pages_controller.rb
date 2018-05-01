class StaticPagesController < ApplicationController
  def home
   # p = User.new
   # String hmm = ('a'..'z').to_a.shuffle[0..7].join
   # p.username = hmm
   # render html: p.username
 end
 
 
  def help
    @users = User.all
    #render html: "layouts/parti#partial: 'layouts/front',layouts: 'layouts/front'
  end
  
  def about
  end
  
  def contact
  end
end