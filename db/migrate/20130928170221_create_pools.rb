class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.string :name

      t.timestamps
    end

    add_index :pools, :name, unique: true
  end
end
