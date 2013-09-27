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

ActiveRecord::Schema.define(version: 20130926235020) do

  create_table "forecasts", force: true do |t|
    t.integer  "home_score"
    t.integer  "visitor_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "game_id"
  end

  add_index "forecasts", ["game_id"], name: "index_forecasts_on_game_id"
  add_index "forecasts", ["user_id"], name: "index_forecasts_on_user_id"

  create_table "games", force: true do |t|
    t.datetime "start_at"
    t.integer  "team_home_id"
    t.integer  "team_visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "schedule_id"
    t.integer  "stadium_id"
    t.integer  "team_home_score"
    t.integer  "team_visitor_score"
  end

  add_index "games", ["schedule_id"], name: "index_games_on_schedule_id"
  add_index "games", ["stadium_id"], name: "index_games_on_stadium_id"
  add_index "games", ["team_home_id"], name: "index_games_on_team_home_id"
  add_index "games", ["team_visitor_id"], name: "index_games_on_team_visitor_id"

  create_table "schedules", force: true do |t|
    t.string   "number"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
  end

  add_index "schedules", ["number"], name: "index_schedules_on_number", unique: true
  add_index "schedules", ["season_id"], name: "index_schedules_on_season_id"

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.date     "start_at"
    t.date     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["name"], name: "index_seasons_on_name", unique: true
  add_index "seasons", ["start_at"], name: "index_seasons_on_start_at"

  create_table "stadia", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stadia", ["name"], name: "index_stadia_on_name", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
