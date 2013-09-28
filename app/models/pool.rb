class Pool < ActiveRecord::Base
    validates :name,    presence: true, length: { maximum: 100 }

    belongs_to :owner, :class_name => "User",
         :foreign_key => "user_id"
    belongs_to :schedule

    has_many :pool_games
    has_many :selected_games,  :through => :pool_games,
        :class_name => "Game",
        :source => :game

    delegate :name, :to => :owner, :prefix => true
    delegate :number, :start_at, :end_at, :to => :schedule, :prefix => true

    def addGame(game)
        selected_games.push(game)
    end
end
