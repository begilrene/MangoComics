class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID

    def self.search(search)
      where("'issueID' Like ?" , "%#{search}%") 
    end
    has_many :IComments
end
