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

ActiveRecord::Schema.define(version: 20170121111837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade, comment: "会計簿" do |t|
    t.string "name", null: false, comment: "会計簿名"
  end

  create_table "budgets", force: :cascade, comment: "予算テーブル" do |t|
    t.integer  "book_id",    null: false, comment: "会計簿ID"
    t.integer  "item_id",    null: false, comment: "費目ID"
    t.integer  "amount",     null: false, comment: "金額"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_budgets_on_book_id", using: :btree
    t.index ["item_id"], name: "index_budgets_on_item_id", using: :btree
  end

  create_table "details", force: :cascade, comment: "内訳テーブル" do |t|
    t.string   "name",       null: false, comment: "内訳名"
    t.integer  "item_id",    null: false, comment: "所属費目ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_details_on_item_id", using: :btree
  end

  create_table "entries", force: :cascade, comment: "収支テーブル" do |t|
    t.date     "action_date",   null: false, comment: "アクション日"
    t.integer  "item_id",       null: false, comment: "費目ID"
    t.integer  "detail_id",     null: false, comment: "内訳ID"
    t.integer  "amount",        null: false, comment: "金額"
    t.text     "description",                comment: "コメント"
    t.integer  "input_user_id", null: false, comment: "入力者ID"
    t.integer  "book_id",       null: false, comment: "会計簿ID"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["book_id"], name: "index_entries_on_book_id", using: :btree
    t.index ["detail_id"], name: "index_entries_on_detail_id", using: :btree
    t.index ["item_id"], name: "index_entries_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, comment: "費目テーブル" do |t|
    t.string   "name",                   null: false, comment: "費目名"
    t.integer  "kind",       default: 0, null: false, comment: "収支"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reading_permissions", force: :cascade, comment: "利用者が閲覧可能な会計簿テーブル" do |t|
    t.integer  "user_id",    null: false, comment: "利用者ID"
    t.integer  "book_id",    null: false, comment: "会計簿ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_permissions_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reading_permissions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, comment: "利用者テーブル" do |t|
    t.string   "uid",              null: false, comment: "ログインID"
    t.string   "name",             null: false, comment: "名前"
    t.string   "crypted_password",              comment: "パスワード"
    t.string   "salt",                          comment: "ソルト"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["uid"], name: "index_users_on_uid", unique: true, using: :btree
  end

  add_foreign_key "budgets", "books"
  add_foreign_key "budgets", "items"
  add_foreign_key "details", "items"
  add_foreign_key "entries", "books"
  add_foreign_key "entries", "details"
  add_foreign_key "entries", "items"
  add_foreign_key "entries", "users", column: "input_user_id"
  add_foreign_key "reading_permissions", "books"
  add_foreign_key "reading_permissions", "users"
end
