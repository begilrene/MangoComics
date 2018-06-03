class IComment < ActiveRecord::Base
    self.table_name = 'comments'
    self.primary_key = :commentId
    belongs_to:issue
    belongs_to:user
end
