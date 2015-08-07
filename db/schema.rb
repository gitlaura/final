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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "venue_id"
  end

  add_index "holds", ["user_id"], name: "index_holds_on_user_id", using: :btree
  add_index "holds", ["venue_id"], name: "index_holds_on_venue_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "venue_id"
  end

  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree
  add_index "likes", ["venue_id"], name: "index_likes_on_venue_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer "venue_id"
    t.string  "url"
  end

  add_index "photos", ["venue_id"], name: "index_photos_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "fname"
    t.string  "lname"
    t.string  "email"
    t.string  "password"
    t.boolean "admin",    default: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "zipcode"
    t.string   "state"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "cuisine"
    t.text     "desc"
    t.string   "url"
    t.string   "reservations"
    t.datetime "created_at"
    t.integer  "user_id"
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

end
