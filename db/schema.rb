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

ActiveRecord::Schema.define(:version => 20130410060813) do

  create_table "company_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "popularity"
  end

  add_index "company_lists", ["name"], :name => "index_company_lists_on_name"

  create_table "ghosts", :force => true do |t|
    t.integer  "member_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "email"
    t.text     "interest_tags"
    t.text     "notes"
  end

  add_index "ghosts", ["member_id"], :name => "index_ghosts_on_member_id"

  create_table "members", :force => true do |t|
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
    t.string   "email"
  end

  add_index "members", ["email"], :name => "index_members_on_email"
  add_index "members", ["remember_token"], :name => "index_members_on_remember_token"

  create_table "prompts", :force => true do |t|
    t.integer  "member_id"
    t.string   "company"
    t.datetime "due_date"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prompts", ["member_id"], :name => "index_prompts_on_member_id"

  create_table "relationships", :force => true do |t|
    t.integer  "member_id"
    t.integer  "contact_id"
    t.text     "interest_tags"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "relationships", ["contact_id"], :name => "index_relationships_on_contact_id"
  add_index "relationships", ["member_id"], :name => "index_relationships_on_member_id"

  create_table "school_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "popularity"
  end

  add_index "school_lists", ["name"], :name => "index_school_lists_on_name"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "company"
    t.string   "school"
    t.string   "current_location"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["profile_id", "profile_type"], :name => "index_users_on_profile_id_and_profile_type"

end
