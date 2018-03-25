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

ActiveRecord::Schema.define(version: 20180324021946) do

  create_table "products", force: :cascade do |t|
    t.string   "uuid",        limit: 255
    t.string   "images",      limit: 255
    t.string   "sell_status", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",      limit: 4
    t.integer  "record_id",   limit: 4
    t.string   "record_type", limit: 255
    t.string   "filter",      limit: 255, default: "tags", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "taggings", ["record_type", "record_id", "filter"], name: "index_taggings_on_record_type_and_record_id_and_filter", using: :btree
  add_index "taggings", ["record_type", "record_id"], name: "index_taggings_on_record_type_and_record_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",           limit: 255,             null: false
    t.integer  "taggings_count", limit: 4,   default: 0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

end
