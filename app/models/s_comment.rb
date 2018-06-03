class SComment < ActiveRecord::Base
    self.table_name = 'comments'
    self.primary_key = :commentId
    belongs_to :series
    belongs_to :user
end
