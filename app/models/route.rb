class Route < ActiveRecord::Base
    attr_accessible :route_name, :route_direction, :route_id, :bus_route_id, :trip_id, :trip_short_name
    has_many :trips
    belongs_to :schedule
end
