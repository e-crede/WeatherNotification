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

ActiveRecord::Schema[7.0].define(version: 2022_05_10_225941) do
  create_table "driver_location_logs", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.string "gps_coordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_driver_location_logs_on_driver_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name", limit: 40
    t.string "last_name", limit: 40
    t.string "email", limit: 40
    t.string "chat_telegram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_statuses", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.string "state"
    t.string "areaDesc"
    t.string "headline"
    t.string "description"
    t.string "instruction"
    t.date "effective"
    t.date "expires"
    t.string "severity"
    t.boolean "notified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_weather_statuses_on_driver_id"
  end

  add_foreign_key "driver_location_logs", "drivers"
  add_foreign_key "weather_statuses", "drivers"
end
