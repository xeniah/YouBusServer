class CreateStops < ActiveRecord::Migration
  def self.up
    create_table :stops do |t|
      t.integer :stop_id
      t.string :stop_name
      t.float :stop_long
      t.float :stop_lat
      t.timestamps
    end
  end

  def self.down
    drop_table :stops
  end
end
