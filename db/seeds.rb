# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require "rexml/document"
include REXML

def read_file(filename)
  result = [];
  counter = 0;
  words = Array.new;
  
  source = File.open(filename);
  source.readlines.each { |line|
   if counter== 0
      words = line.split(',');    
   else
      
      values = line.split(',');
      h = Hash.new;
      index = 0;
      words.each {|w|      
          h[w.chomp] = values[index];
          index+=1; 
        }
      result << h;  
    end
    counter +=1;    
  }
  
  result;
end

def read_file_and_insert_into_db(filename)
  result = [];
  counter = 0;
  
  File.open(filename, 'r') do |f|  
      words = [];
      while line = f.gets          
        if counter == 0
          words = line.split(',');
          counter+=1;
        else
          values = line.split(',');
          h = Hash.new;
          index = 0;
          words.each {|w|      
              h[w.chomp] = values[index];
                index+=1; 
          }
          result << { :trip_id => h["trip_id"], 
                          :arrival_time => h["arrival_time"], 
                          :stop_id => h["stop_id"],
                          :stop_sequence => h["stop_sequence"] 
                         };
          StopTimes.create(result);
          result = [];  
        end
        
      end  
  end
  
  
end



routes = [];
defaultstops = [];
stops = [];
trips = [];
stop_times = [];

routes_filename = 'db/google_transit/routes.txt'
stops_filename = 'db/google_transit/stops.txt'
trips_filename = 'db/google_transit/trips.txt'
stop_times_filename = 'db/google_transit/stop_times_all.txt'
read_file_and_insert_into_db(stop_times_filename);

# routes_hash = read_file(routes_filename);
# stops_hash = read_file(stops_filename);
# trips_hash = read_file(trips_filename);
 #stop_times_hash = read_file(stop_times_filename);

# routes_hash.each {|h| 
#   routes << {:route_id => h["route_id"].to_i, :route_name => h["route_short_name"], :route_direction => ""} ;
# }
# stops_hash.each {|h| 
#   stops << {:stop_id => h["stop_id"], :stop_long => h["stop_lon"], :stop_lat => h["stop_lat"], :stop_name => h["stop_name"]} ;
# }

# trips_hash.each {|h|
#   trips << {:trip_id => h["trip_id"].to_i, :route_id => h["route_id"], :direction_id => h["direction_id"].to_i, :trip_headsign => h["trip_headsign"], :trip_short_name => h["trip_short_name"]} ;
# }
# 
# stop_times_hash.each { |h|
#   stop_times << { :trip_id => h["trip_id"], 
#                   :arrival_time => h["arrival_time"], 
#                   :stop_id => h["stop_id"],
#                   :stop_sequence => h["stop_sequence"] 
#                  };
#                   
#                  
# }
# 

# # 
# Route.create(routes);
# Stop.create(stops);
#StopTimes.create(stop_times);
#Trips.create(trips);
