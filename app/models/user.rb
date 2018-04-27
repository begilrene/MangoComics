class User < ActiveRecord::Base
    self.table_name = 'User'
    self.primary_key = :userID

end
