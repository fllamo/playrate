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

ActiveRecord::Schema.define(version: 20141216150915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "awards", force: true do |t|
    t.string   "name"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awards", ["player_profile_id"], name: "index_awards_on_player_profile_id", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "player_profile_id"
    t.integer  "recruiter_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["player_profile_id"], name: "index_conversations_on_player_profile_id", using: :btree
  add_index "conversations", ["recruiter_profile_id"], name: "index_conversations_on_recruiter_profile_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "when"
    t.string   "location"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["player_profile_id"], name: "index_games_on_player_profile_id", using: :btree

  create_table "highlights", force: true do |t|
    t.string   "custom_title"
    t.string   "video_url"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "highlights", ["player_profile_id"], name: "index_highlights_on_player_profile_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "search_score"
    t.integer  "total_score"
    t.boolean  "seen",               default: false
    t.integer  "position_search_id"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["player_profile_id"], name: "index_matches_on_player_profile_id", using: :btree
  add_index "matches", ["position_search_id"], name: "index_matches_on_position_search_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "note_books", force: true do |t|
    t.integer  "player_profile_id"
    t.integer  "recruiter_profile_id"
    t.text     "notes"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_books", ["player_profile_id"], name: "index_note_books_on_player_profile_id", using: :btree
  add_index "note_books", ["recruiter_profile_id"], name: "index_note_books_on_recruiter_profile_id", using: :btree

  create_table "player_profiles", force: true do |t|
    t.string   "phone"
    t.string   "parent_phone"
    t.datetime "dob"
    t.string   "parent_email"
    t.string   "city"
    t.string   "street_address"
    t.string   "state"
    t.string   "zip"
    t.string   "school"
    t.integer  "graduation_year"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sport_id"
    t.integer  "position_id"
    t.string   "other_sports"
  end

  add_index "player_profiles", ["position_id"], name: "index_player_profiles_on_position_id", using: :btree
  add_index "player_profiles", ["sport_id"], name: "index_player_profiles_on_sport_id", using: :btree
  add_index "player_profiles", ["user_id"], name: "index_player_profiles_on_user_id", unique: true, using: :btree

  create_table "position_searches", force: true do |t|
    t.integer  "recruiter_profile_id"
    t.integer  "sport_id"
    t.integer  "position_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "position_searches", ["position_id"], name: "index_position_searches_on_position_id", using: :btree
  add_index "position_searches", ["recruiter_profile_id"], name: "index_position_searches_on_recruiter_profile_id", using: :btree
  add_index "position_searches", ["sport_id"], name: "index_position_searches_on_sport_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.string   "stats",      default: [], array: true
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["sport_id"], name: "index_positions_on_sport_id", using: :btree

  create_table "recruiter_profiles", force: true do |t|
    t.integer  "sport_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "recruiter_profiles", ["school_id"], name: "index_recruiter_profiles_on_school_id", using: :btree
  add_index "recruiter_profiles", ["sport_id"], name: "index_recruiter_profiles_on_sport_id", using: :btree
  add_index "recruiter_profiles", ["user_id"], name: "index_recruiter_profiles_on_user_id", using: :btree

  create_table "school_sports", force: true do |t|
    t.integer "school_id"
    t.integer "sport_id"
  end

  add_index "school_sports", ["school_id"], name: "index_school_sports_on_school_id", using: :btree
  add_index "school_sports", ["sport_id"], name: "index_school_sports_on_sport_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "conference"
    t.string   "division"
    t.boolean  "public"
    t.string   "state"
    t.string   "city"
    t.string   "website"
    t.integer  "avg_sat_reading_starts_at"
    t.integer  "avg_sat_reading_ends_at"
    t.integer  "avg_sat_math_starts_at"
    t.integer  "avg_sat_math_ends_at"
    t.integer  "avg_sat_writing_starts_at"
    t.integer  "avg_sat_writing_ends_at"
    t.integer  "avg_act_composite_starts_at"
    t.integer  "avg_act_composite_ends_at"
    t.float    "avg_gpa"
    t.integer  "enrollement_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "image_uploaded"
    t.text     "contacts"
  end

  create_table "schools_sports", force: true do |t|
    t.integer "school_id"
    t.integer "sport_id"
  end

  add_index "schools_sports", ["school_id"], name: "index_schools_sports_on_school_id", using: :btree
  add_index "schools_sports", ["sport_id"], name: "index_schools_sports_on_sport_id", using: :btree

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stat_searches", force: true do |t|
    t.string   "name"
    t.integer  "position_search_id"
    t.integer  "coefficient",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stat_searches", ["position_search_id"], name: "index_stat_searches_on_position_search_id", using: :btree

  create_table "stats", force: true do |t|
    t.float    "value"
    t.string   "name"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "academic"
  end

  add_index "stats", ["player_profile_id"], name: "index_stats_on_player_profile_id", using: :btree

  create_table "submissions", force: true do |t|
    t.string   "references"
    t.integer  "player_profile_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["player_profile_id"], name: "index_submissions_on_player_profile_id", using: :btree
  add_index "submissions", ["school_id"], name: "index_submissions_on_school_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "coach"
    t.string   "coach_phone"
    t.string   "coach_email"
    t.boolean  "testimonial_requested"
    t.text     "testimonial"
    t.integer  "jersey_number"
    t.integer  "player_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "varsity"
    t.integer  "duration"
  end

  add_index "teams", ["player_profile_id"], name: "index_teams_on_player_profile_id", using: :btree

  create_table "testimonials", force: true do |t|
    t.string   "sid"
    t.text     "body"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "testimonials", ["team_id"], name: "index_testimonials_on_team_id", using: :btree

  create_table "tiers", force: true do |t|
    t.integer  "importance"
    t.float    "start_value"
    t.integer  "stat_search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tiers", ["stat_search_id"], name: "index_tiers_on_stat_search_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
