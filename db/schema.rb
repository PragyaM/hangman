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

ActiveRecord::Schema.define(version: 20141201010503) do

  create_table "games", force: true do |t|
    t.string   "word",                            null: false
    t.boolean  "finished",        default: false, null: false
    t.integer  "lives_remaining", default: 10,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guesses", force: true do |t|
    t.integer  "game_id",    null: false
    t.string   "letter",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guesses", ["game_id", "letter"], name: "index_guesses_on_game_id_and_letter", unique: true

end