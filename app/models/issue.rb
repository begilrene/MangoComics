class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID

    def self.search(search)
      
      #iss = 'issueName ILike ?'
      #where("CAST lower(issueName AS CHAR) Like ?" , "%#{search.downcase}%.".first) 
    Issue.where("LOWER(issueName) LIKE LOWER('%test%')")
    end

    has_many :IComments
end