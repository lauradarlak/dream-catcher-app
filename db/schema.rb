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

ActiveRecord::Schema.define(version: 2018_11_04_193015) do

  create_table "dream_themes", force: :cascade do |t|
    t.integer "dream_id"
    t.integer "theme_id"
  end

  create_table "dreams", force: :cascade do |t|
    t.string "name"
    t.date "dream_date"
    t.integer "user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "email"
    t.string "password_digest"
  end

end
