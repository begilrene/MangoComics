class Sreview < ApplicationRecord
  self.table_name = 'Review'
  self.primary_key = :reviewid
  belongs_to:series
  belongs_to:user
end
