class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID
  
    def self.search(search)
      search = search.downcase
      where("lower(issuename) Like ? OR lower(summary) Like ? OR lower(synopsis) Like ? OR lower(artist) Like ? OR lower(author) Like ? OR lower(editor) Like ?" , "%#{search}%" ,"%#{search}%","%#{search}%", "%#{search}%" ,"%#{search}%","%#{search}%")
    end
    has_many :IComments, dependent: :destroy
    has_many :IRatings, dependent: :destroy
    has_many :reviews, dependent: :destroy
    belongs_to :volume
end
