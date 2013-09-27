class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :home_score
      t.integer :visitor_score

      t.timestamps
    end
  end
end
