class Vreview < ApplicationRecord
  self.table_name = 'Review'
  self.primary_key = :reviewid
  belongs_to:volume
  belongs_to:user
end
