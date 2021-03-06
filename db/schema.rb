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

ActiveRecord::Schema.define(version: 99) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "hotel_channels", force: :cascade do |t|
    t.string "hotel_channel_id"
    t.bigint "channel_id"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_hotel_channels_on_channel_id"
    t.index ["hotel_id"], name: "index_hotel_channels_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "nombre_huesped"
    t.string "descripcion"
    t.datetime "fecha"
    t.integer "canal"
    t.bigint "hotel_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_notifications_on_hotel_id"
    t.index ["reservation_id"], name: "index_notifications_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "host_name"
    t.string "host_email"
    t.string "host_phone_number"
    t.datetime "date_from"
    t.datetime "date_to"
    t.string "channel_reservation_id"
    t.string "status"
    t.string "confirmation_number"
    t.datetime "reservation_date"
    t.bigint "hotel_id"
    t.bigint "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_reservations_on_channel_id"
    t.index ["hotel_id"], name: "index_reservations_on_hotel_id"
  end

  create_table "reservations_rooms", id: false, force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "room_id", null: false
    t.index ["reservation_id", "room_id"], name: "index_reservations_rooms_on_reservation_id_and_room_id"
    t.index ["room_id", "reservation_id"], name: "index_reservations_rooms_on_room_id_and_reservation_id"
  end

  create_table "room_type_channels", force: :cascade do |t|
    t.integer "beds"
    t.string "room_channel_id"
    t.bigint "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_room_type_channels_on_channel_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "number"
    t.integer "beds"
    t.string "status"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "notifications", "hotels"
  add_foreign_key "notifications", "reservations"
  add_foreign_key "reservations", "channels"
  add_foreign_key "reservations", "hotels"
  add_foreign_key "rooms", "hotels"
end
