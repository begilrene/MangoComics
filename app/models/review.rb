class Review < ApplicationRecord
  self.table_name = 'Review'
  self.primary_key = :reviewid
  belongs_to:issue
  belongs_to:user
end
