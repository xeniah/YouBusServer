class Trips < ActiveRecord::Base
    attr_accessible :block_id, :route_id, :direction_id, :trip_headsign, :trip_id, :trip_short_name
    belongs_to :route
    belongs_to :schedule
end
