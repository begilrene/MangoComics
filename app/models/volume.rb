class Volume < ActiveRecord::Base
    self.table_name = 'Volume'
    self.primary_key = :volumeID
    has_many :vreviews, dependent: :destroy
end
