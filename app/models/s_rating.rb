class SRating < ActiveRecord::Base
    self.table_name = 'rating'
    self.primary_key = :ratingID
    belongs_to :user
    belongs_to :series
    def self.star(id)
    total = 0
    count = 0
    where(:series_id => id).each do |rate|
        total += rate.rating.to_i
        count += 1
    end
    if(count!=0)
        total/count
    else
        count
    end
    end
    
end
