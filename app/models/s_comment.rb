class SComment < ActiveRecord::Base
    self.table_name = 'SComments'
    self.primary_key = :commentId

end
