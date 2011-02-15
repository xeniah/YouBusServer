class Route < ActiveRecord::Base
    attr_accessible :route_name, :route_direction, :route_id
    has_many :trips
    belongs_to :schedule
end
