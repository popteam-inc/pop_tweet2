# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_21_072711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "user_name"
    t.text "image_url"
    t.string "token"
    t.string "secret"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "autofollows", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_autofollows_on_account_id"
  end

  create_table "autolikes", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_autolikes_on_account_id"
  end

  create_table "autoposts", force: :cascade do |t|
    t.text "autopost_caption"
    t.text "image1"
    t.text "image2"
    t.text "image3"
    t.text "image4"
    t.text "autopost_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_autoposts_on_account_id"
  end

  create_table "autounfollows", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_autounfollows_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "user_name"
    t.text "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "autofollows", "accounts"
  add_foreign_key "autolikes", "accounts"
  add_foreign_key "autoposts", "accounts"
  add_foreign_key "autounfollows", "accounts"
end
