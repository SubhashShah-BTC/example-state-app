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

ActiveRecord::Schema.define(version: 20160215091708) do

  create_table "addresses", force: :cascade do |t|
    t.string   "building",    limit: 255, null: false
    t.string   "street",      limit: 255, null: false
    t.string   "landmark",    limit: 255
    t.string   "city",        limit: 255, null: false
    t.string   "state",       limit: 255, null: false
    t.string   "country",     limit: 255, null: false
    t.string   "zip",         limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "property_id", limit: 4
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
  end

  add_index "addresses", ["country"], name: "by_country", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "property_id",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "description",    limit: 255
    t.date     "established_on"
    t.integer  "available_for",  limit: 4,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "owner_id",       limit: 4,   null: false
  end

  add_index "properties", ["owner_id"], name: "index_properties_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "role",                   limit: 4,   default: 3,  null: false
    t.string   "name",                   limit: 255,              null: false
    t.string   "mobile_number",          limit: 255,              null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
