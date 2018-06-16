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

ActiveRecord::Schema.define(version: 2018_06_16_052226) do

  create_table "bets", force: :cascade do |t|
    t.integer "match_id"
    t.integer "user_id"
    t.integer "bet"
    t.integer "bet_left_score"
    t.integer "bet_right_score"
    t.boolean "yellow_card"
    t.boolean "red_card"
    t.boolean "own_goal"
    t.boolean "extra_time"
    t.boolean "penalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_bets_on_match_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "configs", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start"
    t.boolean "knockout"
    t.integer "left_id"
    t.integer "team_id"
    t.integer "right_id"
    t.integer "result"
    t.integer "left_score"
    t.integer "right_score"
    t.boolean "yellow_card"
    t.boolean "red_card"
    t.boolean "own_goal"
    t.boolean "extra_time"
    t.boolean "penalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "live"
    t.index ["left_id"], name: "index_matches_on_left_id"
    t.index ["team_id"], name: "index_matches_on_team_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.string "sponsor"
    t.decimal "price"
    t.string "images"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_prizes_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "group_id"
    t.boolean "club"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_id"
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "image"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.string "top_goal_scorer"
    t.boolean "payment"
    t.string "party"
    t.string "nickname"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

end
