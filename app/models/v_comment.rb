class VComment < ActiveRecord::Base
    self.table_name = 'VComments'
    self.primary_key = :commentId

end
