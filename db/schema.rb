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

ActiveRecord::Schema.define(version: 20180112185100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.string   "body"
    t.boolean  "published"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "blog_id"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "author"
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "game_assignments", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "game_assignments", ["collection_id"], name: "index_game_assignments_on_collection_id", using: :btree
  add_index "game_assignments", ["game_id"], name: "index_game_assignments_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "release_year"
    t.string   "genre"
    t.string   "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "img_url"
    t.string   "publisher",        default: "unknown"
    t.string   "developer",        default: "unknown"
    t.string   "japanese_title"
    t.string   "romaji"
    t.string   "color",            default: "No"
    t.string   "back_url"
    t.string   "english_friendly"
    t.string   "video_url"
  end

  create_table "tag_assignments", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_assignments", ["blog_id"], name: "index_tag_assignments_on_blog_id", using: :btree
  add_index "tag_assignments", ["tag_id"], name: "index_tag_assignments_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "username"
    t.integer  "permission",      default: 0
  end

  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "game_assignments", "collections"
  add_foreign_key "game_assignments", "games"
  add_foreign_key "tag_assignments", "blogs"
  add_foreign_key "tag_assignments", "tags"
end
