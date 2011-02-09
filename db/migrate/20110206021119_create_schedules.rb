class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :route_id
      t.integer :trip_id
      t.integer :stop_sequence
      t.integer :stop_id
      t.time :arrival_time
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
