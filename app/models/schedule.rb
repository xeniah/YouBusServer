class Schedule < ActiveRecord::Base
    attr_accessible :route_id, :trip_id, :stop_sequence, :stop_id, :arrival_time
    has_many :stops
    has_many :trips
    has_many :routes
end
