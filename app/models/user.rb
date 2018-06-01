class User < ActiveRecord::Base
    has_many :IComments, dependent: :destroy
    has_many :MComments, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :sreviews, dependent: :destroy
    has_many :vreviews, dependent: :destroy
    has_many :flists, dependent: :destroy
    has_many :IRatings, dependent: :destroy
    before_save { self.email = email.downcase }
    self.table_name = 'User'
    self.primary_key = :userID
    validates :displayName, presence: true,
    uniqueness: true
     VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i
    validates :email, presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
end