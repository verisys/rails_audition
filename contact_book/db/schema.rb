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

ActiveRecord::Schema.define(version: 20160819074951) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "department_id",           limit: 4
    t.string   "name",                    limit: 255
    t.string   "business_phone",          limit: 255
    t.integer  "business_extension",      limit: 4
    t.string   "home_phone",              limit: 255
    t.string   "emergency_contact_name",  limit: 255
    t.string   "emergency_contact_phone", limit: 255
    t.boolean  "active",                              default: true
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "contacts", ["department_id"], name: "index_contacts_on_department_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "supervisor_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "departments", ["supervisor_id"], name: "index_departments_on_supervisor_id", using: :btree

  create_table "supervisors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
