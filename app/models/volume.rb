class Volume < ActiveRecord::Base
    self.table_name = 'Volume'
    self.primary_key = :volumeID
    has_many :vreviews, dependent: :destroy
    has_many :VRatings, dependent: :destroy
    has_many :VComments, dependent: :destroy
end
