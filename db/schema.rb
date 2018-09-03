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

ActiveRecord::Schema.define(version: 2018_09_03_095929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text "original_content"
    t.text "student_content"
    t.text "final_content"
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.string "pdf"
    t.integer "price_cents", default: 0, null: false
    t.index ["lesson_id"], name: "index_documents_on_lesson_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "status", default: "To Do", null: false
    t.text "original_content"
    t.text "final_content"
    t.bigint "document_id"
    t.bigint "user_id"
    t.integer "order"
    t.index ["document_id"], name: "index_sections_on_document_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "student_lessons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "index_student_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_student_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_type"
    t.string "institution"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "lessons"
  add_foreign_key "documents", "users"
  add_foreign_key "lessons", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "sections", "documents"
  add_foreign_key "sections", "users"
  add_foreign_key "student_lessons", "lessons"
  add_foreign_key "student_lessons", "users"
end
