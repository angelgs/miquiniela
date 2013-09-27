class AddFieldsScoreGames < ActiveRecord::Migration
  def change
      add_column :games, :team_home_score, :integer
      add_column :games, :team_visitor_score, :integer
  end  
end
