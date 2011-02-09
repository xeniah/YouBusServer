# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110206210339) do

  create_table "checkins", :force => true do |t|
    t.integer  "route_id"
    t.float    "reported_lat"
    t.float    "reported_long"
    t.datetime "reported_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.integer  "route_id"
    t.integer  "trip_id"
    t.string   "route_name"
    t.string   "route_direction"
    t.string   "trip_short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "route_id"
    t.integer  "trip_id"
    t.integer  "stop_sequence"
    t.integer  "stop_id"
    t.time     "arrival_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stop_times", :force => true do |t|
    t.string   "trip_id"
    t.datetime "arrival_time"
    t.integer  "stop_id"
    t.integer  "stop_sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", :force => true do |t|
    t.integer  "stop_id"
    t.string   "stop_name"
    t.float    "stop_long"
    t.float    "stop_lat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.string   "trip_id"
    t.string   "block_id"
    t.integer  "route_id"
    t.integer  "direction_id"
    t.string   "trip_headsign"
    t.string   "trip_short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
