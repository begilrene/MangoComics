class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID

    def self.search(search)
      iss = 'issueName Like ?'
      where("CAST(issueName AS CHAR) Like ?" , "%#{search}%") 
    end
    has_many :IComments
end
