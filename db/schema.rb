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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180704090457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_bookings_on_reservation_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image"
    t.index ["user_id"], name: "index_fields_on_user_id"
  end

  create_table "hours", force: :cascade do |t|
    t.datetime "start_time"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.datetime "end_time"
    t.index ["field_id"], name: "index_hours_on_field_id"
  end

  create_table "periods", force: :cascade do |t|
    t.bigint "hour_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hour_id"], name: "index_periods_on_hour_id"
    t.index ["reservation_id"], name: "index_periods_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "field_id"
    t.index ["field_id"], name: "index_reservations_on_field_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "open_id"
    t.string "nickname"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
  end

  add_foreign_key "bookings", "reservations"
  add_foreign_key "bookings", "users"
  add_foreign_key "fields", "users"
  add_foreign_key "hours", "fields"
  add_foreign_key "periods", "hours"
  add_foreign_key "periods", "reservations"
  add_foreign_key "reservations", "fields"
end
