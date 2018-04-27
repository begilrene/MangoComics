class Series < ActiveRecord::Base
    self.table_name = 'Series'
    self.primary_key = :seriesID

end
