class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID

    def self.search(search)
      
      #iss = 'issueName ILike ?'
      #where("CAST lower(issueName AS CHAR) Like ?" , "%#{search.downcase}%.".first) 

    if search
      where("LOWER(issueName) like ?","%#{search.downcase}%")
    else
      all
    end
    end

    has_many :IComments
end

    def self.search(search)
      iss = 'issueName Like ?'
      where("CAST(issueName AS CHAR) Like ?" , "%#{search}%") 
    end
    has_many :IComments
end
