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

ActiveRecord::Schema.define(version: 20160909180735) do

  create_table "houses", force: :cascade do |t|
    t.integer  "house_id"
    t.integer  "user_id"
    t.string   "neighborhood"
    t.float    "price"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "active"
    t.string   "season"
    t.string   "gender"
    t.boolean  "smoking"
    t.boolean  "drinking"
    t.boolean  "pets_allowed"
    t.boolean  "furnished"
    t.string   "bath"
    t.string   "type"
    t.string   "laundry"
    t.boolean  "utilities_included"
    t.text     "description"
    t.boolean  "parking"
    t.float    "num_of_bedrooms"
    t.float    "num_of_bathrooms"
    t.boolean  "private_room"
    t.boolean  "private_bath"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "picture_id"
    t.integer  "house_id"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "pref_id"
    t.integer  "user_id"
    t.string   "neighborhood_pref"
    t.string   "gender_pref"
    t.float    "price_limit_pref"
    t.string   "room_pref"
    t.string   "season_pref"
    t.boolean  "smoking_pref"
    t.boolean  "drinking_pref"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "fb_link"
    t.string   "picture"
    t.string   "gender"
    t.boolean  "is_owner"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
