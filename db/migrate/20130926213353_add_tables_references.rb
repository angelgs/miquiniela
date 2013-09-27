class AddTablesReferences < ActiveRecord::Migration
  def change
      add_reference :schedules, :season, index: true
      add_reference :games, :schedule, index: true
      add_reference :games, :stadium, index: true
      add_reference :forecasts, :user, index: true
      add_reference :forecasts, :game, index: true            
  end
end
