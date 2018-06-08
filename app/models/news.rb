class News < ActiveRecord::Base
    self.table_name = 'New'
    self.primary_key = :newsId
    has_many :MComments
end
