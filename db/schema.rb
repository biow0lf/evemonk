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

ActiveRecord::Schema.define(version: 2018_06_18_151304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "uid"
    t.string "name"
    t.string "token"
    t.string "refresh_token"
    t.datetime "token_expires_at"
    t.boolean "token_expires"
    t.string "scopes"
    t.string "token_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "corporation_id"
    t.datetime "birthday"
    t.string "gender"
    t.integer "race_id"
    t.integer "bloodline_id"
    t.text "description"
    t.integer "alliance_id"
    t.integer "ancestry_id"
    t.decimal "security_status", precision: 18, scale: 16
    t.string "portrait_small"
    t.string "portrait_medium"
    t.string "portrait_large"
    t.string "portrait_huge"
    t.float "wallet"
    t.integer "charisma"
    t.integer "intelligence"
    t.integer "memory"
    t.integer "perception"
    t.integer "willpower"
    t.integer "bonus_remaps"
    t.datetime "last_remap_date"
    t.datetime "accrued_remap_cooldown_date"
    t.integer "faction_id"
    t.index ["alliance_id"], name: "index_characters_on_alliance_id"
    t.index ["ancestry_id"], name: "index_characters_on_ancestry_id"
    t.index ["bloodline_id"], name: "index_characters_on_bloodline_id"
    t.index ["corporation_id"], name: "index_characters_on_corporation_id"
    t.index ["faction_id"], name: "index_characters_on_faction_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["uid"], name: "index_characters_on_uid", unique: true
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "eve_alliances", force: :cascade do |t|
    t.integer "alliance_id"
    t.string "name"
    t.integer "creator_id"
    t.integer "creator_corporation_id"
    t.string "ticker"
    t.integer "executor_corporation_id"
    t.datetime "date_founded"
    t.integer "faction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_small"
    t.string "icon_medium"
    t.index ["alliance_id"], name: "index_eve_alliances_on_alliance_id", unique: true
  end

  create_table "eve_ancestries", force: :cascade do |t|
    t.integer "ancestry_id"
    t.string "name"
    t.integer "bloodline_id"
    t.text "description"
    t.string "short_description"
    t.integer "icon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry_id"], name: "index_eve_ancestries_on_ancestry_id", unique: true
  end

  create_table "eve_bloodlines", force: :cascade do |t|
    t.integer "bloodline_id"
    t.string "name"
    t.text "description"
    t.integer "race_id"
    t.integer "ship_type_id"
    t.integer "corporation_id"
    t.integer "perception"
    t.integer "willpower"
    t.integer "charisma"
    t.integer "memory"
    t.integer "intelligence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bloodline_id"], name: "index_eve_bloodlines_on_bloodline_id", unique: true
  end

  create_table "eve_corporations", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.integer "member_count"
    t.integer "ceo_id"
    t.integer "alliance_id"
    t.text "description"
    t.decimal "tax_rate"
    t.datetime "date_founded"
    t.integer "creator_id"
    t.string "corporation_url"
    t.integer "faction_id"
    t.integer "home_station_id"
    t.integer "shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "corporation_id"
    t.index ["corporation_id"], name: "index_eve_corporations_on_corporation_id", unique: true
  end

  create_table "eve_factions", force: :cascade do |t|
    t.integer "faction_id"
    t.string "name"
    t.text "description"
    t.integer "solar_system_id"
    t.integer "corporation_id"
    t.integer "militia_corporation_id"
    t.float "size_factor"
    t.integer "station_count"
    t.integer "station_system_count"
    t.boolean "is_unique"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_eve_factions_on_faction_id", unique: true
  end

  create_table "eve_races", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "race_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "alliance_id"
    t.index ["race_id"], name: "index_eve_races_on_race_id", unique: true
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "corporation_id"
    t.integer "loyalty_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "corporation_id"], name: "index_loyalty_points_on_character_id_and_corporation_id", unique: true
    t.index ["character_id"], name: "index_loyalty_points_on_character_id"
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "environment"
    t.text "certificate"
    t.string "password"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
    t.string "auth_key"
    t.string "client_id"
    t.string "client_secret"
    t.string "access_token"
    t.datetime "access_token_expiration"
    t.string "apn_key"
    t.string "apn_key_id"
    t.string "team_id"
    t.string "bundle_id"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string "device_token", limit: 64, null: false
    t.datetime "failed_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token"
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer "badge"
    t.string "device_token", limit: 64
    t.string "sound"
    t.text "alert"
    t.text "data"
    t.integer "expiry", default: 86400
    t.boolean "delivered", default: false, null: false
    t.datetime "delivered_at"
    t.boolean "failed", default: false, null: false
    t.datetime "failed_at"
    t.integer "error_code"
    t.text "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alert_is_json", default: false, null: false
    t.string "type", null: false
    t.string "collapse_key"
    t.boolean "delay_while_idle", default: false, null: false
    t.text "registration_ids"
    t.integer "app_id", null: false
    t.integer "retries", default: 0
    t.string "uri"
    t.datetime "fail_after"
    t.boolean "processing", default: false, null: false
    t.integer "priority"
    t.text "url_args"
    t.string "category"
    t.boolean "content_available", default: false, null: false
    t.text "notification"
    t.boolean "mutable_content", default: false, null: false
    t.string "external_device_id"
    t.index ["delivered", "failed", "processing", "deliver_after", "created_at"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "device_token"
    t.integer "device_type"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notifications_count", default: 0
    t.integer "kind", default: 0
    t.index "lower((email)::text)", name: "index_users_on_LOWER_email", unique: true
  end

  add_foreign_key "characters", "users"
  add_foreign_key "sessions", "users"
end
