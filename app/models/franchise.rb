class Franchise < ActiveRecord::Base
    self.table_name = 'Franchise'
    self.primary_key = :franchiseID

end
