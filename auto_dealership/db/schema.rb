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

ActiveRecord::Schema.define(version: 20160822015033) do

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "position_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "username",    limit: 255
    t.string   "password",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["position_id"], name: "index_users_on_position_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.integer  "location_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "year",        limit: 4
    t.string   "make",        limit: 255
    t.string   "model",       limit: 255
    t.string   "vin",         limit: 255
    t.string   "price",       limit: 255
    t.integer  "milage",      limit: 4
    t.string   "ext_color",   limit: 255
    t.string   "int_color",   limit: 255
    t.integer  "locationid",  limit: 4
    t.boolean  "available",               default: true
    t.string   "sold_price",  limit: 255
    t.integer  "userid",      limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "vehicles", ["location_id"], name: "index_vehicles_on_location_id", using: :btree
  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

end
