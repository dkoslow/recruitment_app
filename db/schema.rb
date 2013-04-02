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

ActiveRecord::Schema.define(:version => 20130402064609) do

  create_table "ghosts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ghosts", ["user_id"], :name => "index_ghost_profiles_on_user_id"

  create_table "members", :force => true do |t|
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "members", ["remember_token"], :name => "index_member_profiles_on_remember_token"

  create_table "prompts", :force => true do |t|
    t.integer  "user_id"
    t.string   "company"
    t.datetime "due_date"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prompts", ["user_id"], :name => "index_prompts_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.text     "interest_tags"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "relationships", ["contact_id"], :name => "index_relationships_on_contact_id"
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "company"
    t.string   "school"
    t.string   "current_location"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["profile_id"], :name => "index_users_on_profile_id"
  add_index "users", ["profile_type"], :name => "index_users_on_profile_type"

end
