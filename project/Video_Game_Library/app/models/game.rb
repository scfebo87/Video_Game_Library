class Game < ActiveRecord::Base
    belongs_to :console, :counter_cache => true
    belongs_to :user
    validates :title, presence: true
end
