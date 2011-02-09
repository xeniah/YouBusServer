class Checkins < ActiveRecord::Base
    attr_accessible :route_id, :reported_lat, :reported_long, :reported_datetime
end
