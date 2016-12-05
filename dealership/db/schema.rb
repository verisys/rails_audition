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

ActiveRecord::Schema.define(version: 20160729045144) do

  create_table "locations", force: :cascade do |t|
    t.string   "address",    default: "To Be Determined"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["address"], name: "index_locations_on_address"
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.decimal  "price",      precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["user_id"], name: "index_sales_on_user_id"
    t.index ["vehicle_id"], name: "index_sales_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "password_digest"
    t.boolean  "owner",           default: false
    t.string   "position",        default: "Salesman"
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.decimal  "list_price",  precision: 15, scale: 2
    t.integer  "location_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "sold",                                 default: false
    t.index ["location_id"], name: "index_vehicles_on_location_id"
    t.index ["make"], name: "index_vehicles_on_make"
    t.index ["model"], name: "index_vehicles_on_model"
  end

end
