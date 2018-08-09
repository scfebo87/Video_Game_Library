class Note < ActiveRecord::Base
    belongs_to :game
    validates :description, presence: true
end
