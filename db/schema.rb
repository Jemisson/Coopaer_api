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

ActiveRecord::Schema[7.0].define(version: 2024_03_21_022440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_educationals", force: :cascade do |t|
    t.string "degree"
    t.string "course"
    t.string "number_register"
    t.bigint "profile_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_member_id"], name: "index_academic_educationals_on_profile_member_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "neighborhood"
    t.string "city"
    t.string "uf"
    t.string "mailing"
    t.string "email_mailing"
    t.bigint "profile_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_member_id"], name: "index_addresses_on_profile_member_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["jti"], name: "index_admins_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "account"
    t.string "agency"
    t.string "bank"
    t.string "account_type"
    t.string "pix"
    t.bigint "profile_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_member_id"], name: "index_bank_accounts_on_profile_member_id"
  end

  create_table "dependents", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.bigint "profile_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "degree"
    t.index ["profile_member_id"], name: "index_dependents_on_profile_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["jti"], name: "index_members_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "profile_members", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "name"
    t.string "cell_phone"
    t.string "phone"
    t.date "birth"
    t.string "cpf"
    t.string "rg"
    t.integer "gender"
    t.string "marital_status"
    t.string "pis"
    t.string "expedition"
    t.string "mother_name"
    t.string "father_name"
    t.string "city_registration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.string "cnd"
    t.index ["member_id"], name: "index_profile_members_on_member_id"
  end

  create_table "senar_reports", force: :cascade do |t|
    t.bigint "profile_member_id", null: false
    t.string "name"
    t.string "event"
    t.string "event_init_date"
    t.string "event_finish_date"
    t.decimal "amount"
    t.string "invoice"
    t.string "receipt"
    t.string "status_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_member_id"], name: "index_senar_reports_on_profile_member_id"
  end

  add_foreign_key "academic_educationals", "profile_members"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "profile_members"
  add_foreign_key "bank_accounts", "profile_members"
  add_foreign_key "dependents", "profile_members"
  add_foreign_key "profile_members", "members"
  add_foreign_key "senar_reports", "profile_members"
end
