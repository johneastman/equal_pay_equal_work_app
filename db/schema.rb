# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_02_205329) do
  create_table "complaints", force: :cascade do |t|
    t.boolean "promotional_opportunities"
    t.text "promotional_opportunities_description"
    t.boolean "compensation"
    t.text "compensation_description"
    t.boolean "history"
    t.text "history_description"
    t.text "supporting_documentation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "contact_person_name"
    t.string "mailing_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone_number"
    t.string "email_address"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_references", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "employer_id", null: false
    t.integer "complaint_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complaint_id"], name: "index_user_references_on_complaint_id"
    t.index ["employer_id"], name: "index_user_references_on_employer_id"
    t.index ["user_id"], name: "index_user_references_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mailing_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "primary_phone"
    t.string "alt_phone"
    t.string "email"
    t.string "preferred_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "user_references", "complaints"
  add_foreign_key "user_references", "employers"
  add_foreign_key "user_references", "users"
end
