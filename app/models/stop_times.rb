class StopTimes < ActiveRecord::Base
    attr_accessible :trip_id, :arrival_time, :stop_id, :stop_sequence
end
