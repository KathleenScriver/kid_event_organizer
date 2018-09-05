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

ActiveRecord::Schema.define(version: 20180905021636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "day_of_week"
    t.time "time"
    t.text "description"
    t.bigint "kid_id"
    t.index ["kid_id"], name: "index_events_on_kid_id"
  end

  create_table "kids", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_kids", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "kid_id"
    t.index ["kid_id"], name: "index_user_kids_on_kid_id"
    t.index ["user_id"], name: "index_user_kids_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  add_foreign_key "events", "kids"
  add_foreign_key "user_kids", "kids"
  add_foreign_key "user_kids", "users"
end
