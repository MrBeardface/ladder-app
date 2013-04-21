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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130420234658) do

  create_table "matches", :force => true do |t|
    t.integer  "challenger_id"
    t.integer  "challenged_player_id"
    t.datetime "played_at"
    t.integer  "challenger_game1"
    t.integer  "challenged_player_game1"
    t.integer  "challenger_game2"
    t.integer  "challenged_player_game2"
    t.integer  "challenger_game3"
    t.integer  "challenged_player_game3"
    t.integer  "winner"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "matches", ["challenged_player_id"], :name => "index_matches_on_challenged_player_id"
  add_index "matches", ["challenger_id"], :name => "index_matches_on_challenger_id"

  create_table "players", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "rank",                   :default => 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

end
