class AddIndexTeamsGames < ActiveRecord::Migration
  def change
      add_index :games, :team_home_id
      add_index :games, :team_visitor_id
  end
end
