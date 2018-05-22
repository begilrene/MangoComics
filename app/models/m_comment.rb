class MComment < ActiveRecord::Base
    self.table_name = 'MComment'
    self.primary_key = :commentId
    belongs_to :user
    belongs_to :new
end
