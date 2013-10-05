class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, :null => false, :limit => 50
      t.string :image

      t.timestamps
    end
  end
end
