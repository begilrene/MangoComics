class SComment < ActiveRecord::Base
    self.table_name = 'SComments'
    self.primary_key = :commentId
    belongs_to :series
end
