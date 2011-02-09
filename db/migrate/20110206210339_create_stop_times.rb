class CreateStopTimes < ActiveRecord::Migration
  def self.up
    create_table :stop_times do |t|
      t.string :trip_id
      t.datetime :arrival_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.timestamps
    end
  end

  def self.down
    drop_table :stop_times
  end
end
