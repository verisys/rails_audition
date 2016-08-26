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

ActiveRecord::Schema.define(version: 20160826031647) do

  create_table "car_details", force: :cascade do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.text     "engine"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.decimal  "price"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location_name"
    t.text     "address"
    t.string   "state"
    t.integer  "phone_number"
    t.integer  "zip"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
