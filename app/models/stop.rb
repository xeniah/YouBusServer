class Stop < ActiveRecord::Base
    acts_as_mappable   :default_units => :miles,
                       :default_formula => :sphere,
                       :distance_field_name => :distance,
                       :lat_column_name => :stop_lat,
                       :lng_column_name => :stop_long
    
    attr_accessible :id, :stop_name, :stop_long, :stop_lat, :stop_id
end
