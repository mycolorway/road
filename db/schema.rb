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

ActiveRecord::Schema.define(:version => 20130720172643) do

  create_table "geo_points", :force => true do |t|
    t.string   "sti_type",                             :null => false
    t.decimal  "latitude",                             :null => false
    t.decimal  "longitude",                            :null => false
    t.decimal  "elevation",                            :null => false
    t.datetime "attributes_updated_at",                :null => false
    t.integer  "story_id",                             :null => false
    t.integer  "creator_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "subtype",               :default => 0, :null => false
    t.text     "description"
  end

  add_index "geo_points", ["creator_id"], :name => "index_geo_points_on_creator_id"
  add_index "geo_points", ["story_id"], :name => "index_geo_points_on_story_id"

  create_table "photos", :force => true do |t|
    t.string   "attachment"
    t.integer  "story_id",   :null => false
    t.integer  "creator_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["creator_id"], :name => "index_photos_on_creator_id"
  add_index "photos", ["story_id"], :name => "index_photos_on_story_id"

  create_table "stories", :force => true do |t|
    t.string   "title",              :null => false
    t.text     "content"
    t.integer  "creator_id",         :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.decimal  "total_distance_km",  :null => false
    t.decimal  "total_climbing_m",   :null => false
    t.decimal  "total_descending_m", :null => false
    t.integer  "subtype",            :null => false
    t.decimal  "difficulty_index",   :null => false
  end

  add_index "stories", ["creator_id"], :name => "index_stories_on_creator_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
