class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueName

    def self.search(search)
    if search
      losearch = search.downcase
      where("lower(issueName) LIKE ?", "%#{search.to_s.downcase}%")
    end
    end
end
