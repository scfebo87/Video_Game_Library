class Console < ActiveRecord::Base
    has_many :games
    has_many :users, through: :games
    validates :name, :model, :company, presence: true
end
