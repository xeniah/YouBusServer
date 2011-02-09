class Schedule < ActiveRecord::Base
    attr_accessible :route_id, :trip_id, :stop_sequence, :stop_id, :arrival_time
end
