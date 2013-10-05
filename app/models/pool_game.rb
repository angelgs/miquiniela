class PoolGame < ActiveRecord::Base
    belongs_to :pool
    belongs_to :game
    validates :pool_id, presence: true
    validates :game_id, presence: true
end
