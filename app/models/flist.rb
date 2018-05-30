class Flist < ApplicationRecord
  self.table_name = 'flist'
  belongs_to:user
end
