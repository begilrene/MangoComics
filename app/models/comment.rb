class Comment < ActiveRecord::Base
    self.table_name = 'comments'
    self.primary_key = :commentId
end
