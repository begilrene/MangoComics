class Series < ActiveRecord::Base
    self.table_name = 'Series'
    self.primary_key = :seriesID
    has_many :sreviews, dependent: :destroy
end
