class Pool < ActiveRecord::Base
    validates :name,    presence: true, length: { maximum: 100 }
    validate :user_id, presence: true
    validate :schedule_id, presence: true

    belongs_to :owner, :class_name => "User",
         :foreign_key => "user_id"
    belongs_to :schedule

    has_many :pool_games, dependent: :destroy
    has_many :selected_games,  :through => :pool_games,
        :class_name => "Game",
        :source => :game

    delegate :name, :to => :owner, :prefix => true
    delegate :number, :start_at, :end_at, :to => :schedule, :prefix => true

    def addGame(game)
        selected_games.push(game)
    end
end
