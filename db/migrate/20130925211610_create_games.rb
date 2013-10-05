class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :start_at, :null => false
      t.integer :team_home_id, :null => false
      t.integer :team_visitor_id, :null => false

      t.timestamps
    end
  end
end
