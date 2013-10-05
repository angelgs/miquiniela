class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name, :null => false, :limit => 100

      t.timestamps
    end
  end
end
