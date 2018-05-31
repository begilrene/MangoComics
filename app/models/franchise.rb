class Franchise < ActiveRecord::Base
    self.table_name = 'Franchise'
    self.primary_key = :franchiseID
    has_many :series
    belongs_to :publisher
end
