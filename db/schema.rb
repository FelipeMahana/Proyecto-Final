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

ActiveRecord::Schema.define(version: 20180408044701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.string "code"
    t.string "payment_method"
    t.decimal "amount", precision: 10, scale: 2
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_billings_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.float "weight"
    t.float "height"
    t.integer "activity_level"
    t.text "goal"
    t.float "fat_percentage"
    t.float "bmi"
    t.string "disease"
    t.string "allergies"
    t.float "bmr"
    t.string "karvonen"
    t.integer "heart_rate"
    t.bigint "user_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.integer "sex"
    t.boolean "pending", default: false
    t.bigint "billing_id"
    t.index ["billing_id"], name: "index_contracts_on_billing_id"
    t.index ["plan_id"], name: "index_contracts_on_plan_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.float "price"
    t.date "date_start"
    t.integer "duration"
    t.integer "contract_type"
    t.text "description"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "training"
    t.text "nutrition"
    t.index ["contract_id"], name: "index_programs_on_contract_id"
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
    t.string "name"
    t.string "reference_code", default: "", null: false
    t.integer "user_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "billings", "users"
  add_foreign_key "contracts", "billings"
  add_foreign_key "contracts", "plans"
  add_foreign_key "contracts", "users"
  add_foreign_key "programs", "contracts"
end
