class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
<<<<<<< HEAD
    self.primary_key = :issueID
    has_many :IComments
=======
    self.primary_key = :issueName

    def self.search(search)
    if search
      losearch = search.downcase
      where("lower(issueName) LIKE ?", "%#{search.to_s.downcase}%")
    end
    end
>>>>>>> search
end
