class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name, :null => false, :limit => 100
      t.date :start_at, :null => false
      t.date :end_at, :null => false

      t.timestamps
    end
  end
end
