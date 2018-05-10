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

ActiveRecord::Schema.define(version: 2018_05_10_043514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_from_id"
    t.bigint "language_to_id"
    t.string "subject"
    t.text "description"
    t.integer "price"
    t.datetime "paid_at"
    t.string "stripe_charge_id"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "file_data"
    t.index ["language_from_id"], name: "index_jobs_on_language_from_id"
    t.index ["language_to_id"], name: "index_jobs_on_language_to_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "subject"
    t.text "description"
    t.string "lang_from"
    t.string "lang_to"
    t.text "file_data"
    t.datetime "completed"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.text "image_data"
    t.string "house_number"
    t.string "street_name"
    t.string "suburb"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "subject"
    t.text "description"
    t.string "lang_from"
    t.string "lang_to"
    t.decimal "price"
    t.boolean "paid"
    t.text "file_data"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jobs", "languages", column: "language_from_id"
  add_foreign_key "jobs", "languages", column: "language_to_id"
  add_foreign_key "jobs", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "requests", "users"
end
