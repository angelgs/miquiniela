class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :number
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
