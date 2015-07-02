# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150425195247) do

  create_table "groups", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
    t.string   "street",     limit: 255
    t.string   "city",       limit: 255
    t.integer  "state_id",   limit: 4
    t.integer  "country_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "locations", ["country_id"], name: "index_locations_on_country_id", using: :btree
  add_index "locations", ["state_id"], name: "index_locations_on_state_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.text     "notice",     limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "trip_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "subscribers", ["trip_id"], name: "index_subscribers_on_trip_id", using: :btree
  add_index "subscribers", ["user_id"], name: "index_subscribers_on_user_id", using: :btree

  create_table "transport_types", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.string   "identifier", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "start_location_id",  limit: 4
    t.integer  "end_location_id",    limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "group_id",           limit: 4
    t.integer  "owner_id",           limit: 4
    t.integer  "transport_type_id",  limit: 4
    t.integer  "max_people",         limit: 4
    t.float    "max_baggage_weight", limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "trips", ["end_location_id"], name: "index_trips_on_end_location_id", using: :btree
  add_index "trips", ["group_id"], name: "index_trips_on_group_id", using: :btree
  add_index "trips", ["owner_id"], name: "index_trips_on_owner_id", using: :btree
  add_index "trips", ["start_location_id"], name: "index_trips_on_start_location_id", using: :btree
  add_index "trips", ["transport_type_id"], name: "index_trips_on_transport_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               limit: 255,                null: false
    t.string   "uid",                    limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image",                  limit: 255
    t.string   "email",                  limit: 255
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
