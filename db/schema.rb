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

ActiveRecord::Schema.define(version: 20160728221347) do

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "owner",           default: false
    t.boolean  "manager",         default: false
    t.boolean  "salesman",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "salesman_id"
    t.string   "make",                                                 null: false
    t.string   "model",                                                null: false
    t.integer  "year",                                                 null: false
    t.decimal  "price",       precision: 10, scale: 2,                 null: false
    t.integer  "mpg_city"
    t.integer  "mpg_hwy"
    t.string   "color",                                                null: false
    t.integer  "stock",                                                null: false
    t.string   "vin",                                                  null: false
    t.string   "image_url"
    t.boolean  "sold",                                 default: false
    t.integer  "sell_price",                           default: 0,     null: false
    t.text     "sell_notes"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["location_id"], name: "index_vehicles_on_location_id"
  end

end
