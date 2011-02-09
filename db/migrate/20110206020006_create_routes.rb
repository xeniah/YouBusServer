class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.integer :route_id
      t.integer :trip_id
      t.string :route_name
      t.string :route_direction
      t.string :trip_short_name
      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end


