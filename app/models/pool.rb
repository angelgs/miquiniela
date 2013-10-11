class Pool < ActiveRecord::Base
    belongs_to :user

    has_many :pool_games, dependent: :destroy
    has_many :games,  :through => :pool_games,
        :class_name => "Game",
        :source => :game

    validates :name,    presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
    validates :user_id, presence: true


    delegate :name, :to => :user, :prefix => true
end
