class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :bus_trip_id
      t.string :trip_id
      t.string :block_id
      t.integer :route_id
      t.integer :direction_id
      t.string :trip_headsign
      t.string :trip_short_name
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
