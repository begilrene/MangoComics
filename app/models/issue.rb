class Issue < ActiveRecord::Base
    self.table_name = 'Issue'
    self.primary_key = :issueID
    has_many :IComments
end
