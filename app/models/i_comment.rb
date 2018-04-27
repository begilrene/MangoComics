class IComment < ActiveRecord::Base
    self.table_name = 'IComments'
    self.primary_key = :commentId

end
