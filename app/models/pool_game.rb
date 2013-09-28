class PoolGame < ActiveRecord::Base
    belongs_to :pool
    belongs_to :game
end
