class Series < ActiveRecord::Base
    self.table_name = 'Series'
    self.primary_key = :seriesID
    has_many :sreviews, dependent: :destroy
    has_many :volume
    belongs_to :franchise
    has_many :SRatings, dependent: :destroy
    has_many :SComments, dependent: :destroy
end
