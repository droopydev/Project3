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

ActiveRecord::Schema.define(version: 2019_02_05_121803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centres", force: :cascade do |t|
    t.string "centre_name"
    t.text "reg_no"
    t.integer "contact_no"
    t.text "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_centres_on_user_id"
  end

  create_table "centres_courses", force: :cascade do |t|
    t.bigint "centres_id"
    t.bigint "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["centres_id"], name: "index_centres_courses_on_centres_id"
    t.index ["courses_id"], name: "index_centres_courses_on_courses_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.text "description"
    t.integer "age"
    t.text "category"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "avatar"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "salutation"
    t.string "name"
    t.integer "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "centres", "users"
  add_foreign_key "courses", "users"
end
