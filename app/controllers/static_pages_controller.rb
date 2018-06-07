class StaticPagesController < ApplicationController
  def home
    store_location
   # p = User.new
   # String hmm = ('a'..'z').to_a.shuffle[0..7].join
   # p.username = hmm
   # render html: p.username
  end
 
end
