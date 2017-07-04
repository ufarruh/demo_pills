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

ActiveRecord::Schema.define(version: 20170305045042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name_rus"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "rank",       default: 0
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drug_categories", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["drug_id", "category_id"], name: "index_drug_categories_on_drug_id_and_category_id", using: :btree
  end

  create_table "drug_ingredients", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["drug_id", "ingredient_id"], name: "index_drug_ingredients_on_drug_id_and_ingredient_id", using: :btree
  end

  create_table "drug_nozologies", force: :cascade do |t|
    t.integer  "nozology_id"
    t.integer  "drug_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["nozology_id", "drug_id"], name: "index_drug_nozologies_on_nozology_id_and_drug_id", using: :btree
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name_rus"
    t.string   "name_eng"
    t.string   "packaging"
    t.text     "pharmacology_action"
    t.text     "indications"
    t.text     "release_form"
    t.text     "pharmacodynamics"
    t.text     "pharmacokinetics"
    t.text     "during_pregnancy"
    t.text     "in_impaired_renal_function"
    t.text     "contraindications"
    t.text     "side_effects"
    t.text     "dosing"
    t.text     "overdose"
    t.text     "interactions"
    t.text     "precautions"
    t.text     "cautions"
    t.text     "storage_conditions"
    t.string   "best_before"
    t.text     "special_cases"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "rank",                       default: 0
  end

  create_table "favorite_drugs", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id", "user_id"], name: "index_favorite_drugs_on_drug_id_and_user_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name_rus"
    t.string   "name_eng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nozologies", force: :cascade do |t|
    t.string   "name_rus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_rus"], name: "index_nozologies_on_name_rus", using: :btree
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string   "name"
    t.string   "work_hours"
    t.string   "phone_number"
    t.integer  "city_id"
    t.string   "region"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "pharmacy_drugs", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "pharmacy_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "price",       default: 10
    t.datetime "exp_date"
    t.index ["drug_id", "pharmacy_id"], name: "index_pharmacy_drugs_on_drug_id_and_pharmacy_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
