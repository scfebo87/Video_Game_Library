class Console < ActiveRecord::Base
    has_many :games
    has_many :users, through: :games
    validates :name, :model, :company, presence: true


    def self.most_games
        self.order( "games_count desc" ).limit(1).all
    end



end
