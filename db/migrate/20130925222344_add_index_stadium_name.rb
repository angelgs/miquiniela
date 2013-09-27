class AddIndexStadiumName < ActiveRecord::Migration
  def change
      add_index :stadia, :name, unique: true
  end
end
