class User < ActiveRecord::Base
    has_many :games
    has_many :consoles, through: :games
    has_secure_password
    validates :user_name, :email, :password, presence: true
end
