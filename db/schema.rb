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

ActiveRecord::Schema.define(version: 20151012072455) do

  create_table "books", force: :cascade do |t|
    t.string   "isbn",              limit: 255,                         null: false
    t.string   "title",             limit: 255,   default: ""
    t.string   "author",            limit: 25
    t.string   "status",            limit: 255,   default: "Available"
    t.text     "description",       limit: 65535
    t.datetime "order_date"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "user_id",           limit: 4
    t.string   "suggestion_status", limit: 255,   default: "Approved"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "username",        limit: 25,               null: false
    t.string   "user_type",       limit: 255,              null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "password_digest", limit: 255
  end

  create_table "notifiers", force: :cascade do |t|
    t.string   "email_id",   limit: 255
    t.string   "isbn",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "book_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "order_date"
    t.string   "transaction_type", limit: 255
  end

  add_index "transactions", ["book_id"], name: "index_transactions_on_book_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "username",        limit: 25
    t.string   "user_type",       limit: 255,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "books", "users"
  add_foreign_key "transactions", "books"
  add_foreign_key "transactions", "users"
end
