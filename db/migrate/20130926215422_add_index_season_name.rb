class AddIndexSeasonName < ActiveRecord::Migration
  def change
      add_index :seasons, :name, unique: true
      add_index :seasons, :start_at
  end
end
