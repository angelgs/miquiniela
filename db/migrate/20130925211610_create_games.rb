class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :start_at
      t.integer :team_home_id
      t.integer :team_visitor_id

      t.timestamps
    end
  end
end
