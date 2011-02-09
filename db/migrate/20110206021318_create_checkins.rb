class CreateCheckins < ActiveRecord::Migration
  def self.up
    create_table :checkins do |t|
      t.integer :route_id
      t.float :reported_lat
      t.float :reported_long
      t.datetime :reported_datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :checkins
  end
end
