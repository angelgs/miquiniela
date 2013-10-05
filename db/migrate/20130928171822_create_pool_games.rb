class CreatePoolGames < ActiveRecord::Migration
  def change
    create_table :pool_games do |t|
      t.integer :pool_id, :null => false
      t.integer :game_id, :null => false

      t.timestamps
    end
    add_index :pool_games, :pool_id
    add_index :pool_games, :game_id
    add_index :pool_games, [:pool_id, :game_id], unique: true
  end
end
