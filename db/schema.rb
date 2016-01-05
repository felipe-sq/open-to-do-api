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

ActiveRecord::Schema.define(version: 20160104235139) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "lists", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "public",      default: true
  end

  add_index "lists", ["description"], name: "index_lists_on_description"
  add_index "lists", ["name"], name: "index_lists_on_name"
  add_index "lists", ["public"], name: "index_lists_on_public"
  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
  end

  add_index "users", ["username"], name: "index_users_on_username"

end
