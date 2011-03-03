class AddBusesToStops < ActiveRecord::Migration
  def self.up
    add_column :stops, :stop_routes, :string
  end

  def self.down
    remove_column :stops, :stop_routes
  end
end
  
