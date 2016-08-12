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

ActiveRecord::Schema.define(version: 20160811134247) do

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "business_phone"
    t.string   "business_phone_ext"
    t.string   "home_phone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_number"
    t.boolean  "active",                   default: true, null: false
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["department_id"], name: "index_contacts_on_department_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",      null: false
    t.string   "password",      null: false
    t.string   "role",          null: false
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
