# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_13_031232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "takeoff", null: false
    t.bigint "departure_spaceport_id"
    t.bigint "arrival_spaceport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "duration", null: false
    t.index ["arrival_spaceport_id"], name: "index_flights_on_arrival_spaceport_id"
    t.index ["departure_spaceport_id"], name: "index_flights_on_departure_spaceport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "spaceports", force: :cascade do |t|
    t.string "code", limit: 3, null: false
    t.string "full_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "spaceports", column: "arrival_spaceport_id"
  add_foreign_key "flights", "spaceports", column: "departure_spaceport_id"
  add_foreign_key "passengers", "bookings"
end
