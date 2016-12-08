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

ActiveRecord::Schema.define(version: 20161207043609) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "business_phone"
    t.string   "business_extension"
    t.string   "home_phone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.boolean  "inactive",                default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["business_extension", "business_phone"], name: "index_contacts_on_business_extension_and_business_phone", unique: true
    t.index ["department_id"], name: "index_contacts_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "supervisor_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["supervisor_id"], name: "index_departments_on_supervisor_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
