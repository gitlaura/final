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

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at"
  end

  add_index "likes", ["user_id"], name: "index_likes_on_user_id"
  add_index "likes", ["venue_id"], name: "index_likes_on_venue_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "rating"
    t.string   "notes"
    t.datetime "created_at"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"
  add_index "reviews", ["venue_id"], name: "index_reviews_on_venue_id"

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "zipcode"
    t.string   "state"
    t.string   "city"
    t.text     "desc"
    t.string   "photo_url"
    t.string   "neighborhood"
    t.string   "cuisine"
    t.string   "reservations"
    t.string   "url"
    t.datetime "created_at"
  end

end
