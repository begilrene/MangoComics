class Publisher < ActiveRecord::Base
    self.table_name = 'Publisher'
    self.primary_key = :publisherID

end
