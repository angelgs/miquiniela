class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false, :limit => 100

      t.timestamps
    end

    add_index :pools, :user_id
    add_index :pools, :name, unique: true
  end
end
