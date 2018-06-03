class VComment < ActiveRecord::Base
    self.table_name = 'comments'
    self.primary_key = :commentId
    belongs_to :volume
    belongs_to :user
end
