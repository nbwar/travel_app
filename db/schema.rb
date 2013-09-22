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

ActiveRecord::Schema.define(version: 20130922053742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excursions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "price"
    t.string   "image_url"
    t.string   "link"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.integer  "vote_count",      default: 0
    t.integer  "travel_group_id"
    t.integer  "excursion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_groups", force: true do |t|
    t.string   "name"
    t.string   "destination"
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_code"
  end

  create_table "travel_groups_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "travel_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "image"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.date     "oath_expires_at"
    t.text     "bio"
    t.boolean  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "suggestion_id"
    t.integer  "choice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
