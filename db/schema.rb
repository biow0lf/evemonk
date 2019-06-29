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

ActiveRecord::Schema.define(version: 2019_06_27_100341) do

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
    t.string "name"
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "token_expires_at"
    t.boolean "token_expires"
    t.string "token_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "birthday"
    t.string "gender"
    t.text "description"
    t.decimal "security_status", precision: 18, scale: 16
    t.float "wallet"
    t.integer "charisma"
    t.integer "intelligence"
    t.integer "memory"
    t.integer "perception"
    t.integer "willpower"
    t.integer "bonus_remaps"
    t.datetime "last_remap_date"
    t.datetime "accrued_remap_cooldown_date"
    t.bigint "character_id"
    t.bigint "alliance_id"
    t.bigint "corporation_id"
    t.bigint "race_id"
    t.bigint "bloodline_id"
    t.bigint "ancestry_id"
    t.bigint "faction_id"
    t.text "scopes"
    t.string "character_owner_hash"
    t.string "title"
    t.index ["alliance_id"], name: "index_characters_on_alliance_id"
    t.index ["ancestry_id"], name: "index_characters_on_ancestry_id"
    t.index ["bloodline_id"], name: "index_characters_on_bloodline_id"
    t.index ["character_id"], name: "index_characters_on_character_id", unique: true
    t.index ["character_owner_hash"], name: "index_characters_on_character_owner_hash", unique: true
    t.index ["corporation_id"], name: "index_characters_on_corporation_id"
    t.index ["faction_id"], name: "index_characters_on_faction_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "etags", force: :cascade do |t|
    t.text "url", null: false
    t.text "etag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_etags_on_url", unique: true
  end

  create_table "eve_alliance_corporations", force: :cascade do |t|
    t.bigint "alliance_id"
    t.bigint "corporation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id", "corporation_id"], name: "index_eve_ac_on_alliance_id_and_corporation_id", unique: true
    t.index ["corporation_id"], name: "index_eve_alliance_corporations_on_corporation_id"
  end

  create_table "eve_alliances", force: :cascade do |t|
    t.bigint "alliance_id"
    t.bigint "creator_corporation_id"
    t.bigint "creator_id"
    t.datetime "date_founded"
    t.bigint "executor_corporation_id"
    t.bigint "faction_id"
    t.string "name"
    t.string "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "corporations_count", default: 0
    t.index ["alliance_id"], name: "index_eve_alliances_on_alliance_id", unique: true
  end

  create_table "eve_ancestries", force: :cascade do |t|
    t.bigint "ancestry_id"
    t.bigint "bloodline_id"
    t.text "description"
    t.integer "icon_id"
    t.string "name"
    t.text "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry_id"], name: "index_eve_ancestries_on_ancestry_id", unique: true
  end

  create_table "eve_bloodlines", force: :cascade do |t|
    t.bigint "bloodline_id"
    t.integer "charisma"
    t.bigint "corporation_id"
    t.text "description"
    t.integer "intelligence"
    t.integer "memory"
    t.string "name"
    t.integer "perception"
    t.bigint "race_id"
    t.bigint "ship_type_id"
    t.integer "willpower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bloodline_id"], name: "index_eve_bloodlines_on_bloodline_id", unique: true
  end

  create_table "eve_characters", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "alliance_id"
    t.bigint "ancestry_id"
    t.datetime "birthday"
    t.bigint "bloodline_id"
    t.bigint "corporation_id"
    t.text "description"
    t.bigint "faction_id"
    t.string "gender"
    t.string "name"
    t.bigint "race_id"
    t.float "security_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["alliance_id"], name: "index_eve_characters_on_alliance_id"
    t.index ["character_id"], name: "index_eve_characters_on_character_id", unique: true
    t.index ["corporation_id"], name: "index_eve_characters_on_corporation_id"
  end

  create_table "eve_corporations", force: :cascade do |t|
    t.bigint "corporation_id"
    t.bigint "alliance_id"
    t.bigint "ceo_id"
    t.bigint "creator_id"
    t.datetime "date_founded"
    t.text "description"
    t.bigint "faction_id"
    t.bigint "home_station_id"
    t.integer "member_count"
    t.string "name"
    t.bigint "shares"
    t.float "tax_rate"
    t.string "ticker"
    t.text "corporation_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "war_eligible"
    t.index ["alliance_id"], name: "index_eve_corporations_on_alliance_id"
    t.index ["corporation_id"], name: "index_eve_corporations_on_corporation_id", unique: true
  end

  create_table "eve_factions", force: :cascade do |t|
    t.bigint "faction_id"
    t.bigint "corporation_id"
    t.text "description"
    t.boolean "is_unique"
    t.bigint "militia_corporation_id"
    t.string "name"
    t.float "size_factor"
    t.bigint "solar_system_id"
    t.integer "station_count"
    t.integer "station_system_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faction_id"], name: "index_eve_factions_on_faction_id", unique: true
  end

  create_table "eve_graphics", force: :cascade do |t|
    t.string "collision_file"
    t.string "graphic_file"
    t.bigint "graphic_id"
    t.string "icon_folder"
    t.string "sof_dna"
    t.string "sof_fation_name"
    t.string "sof_hull_name"
    t.string "sof_race_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graphic_id"], name: "index_eve_graphics_on_graphic_id", unique: true
  end

  create_table "eve_races", force: :cascade do |t|
    t.bigint "alliance_id"
    t.text "description"
    t.string "name"
    t.bigint "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_eve_races_on_race_id", unique: true
  end

  create_table "eve_stargates", force: :cascade do |t|
    t.string "name"
    t.bigint "stargate_id"
    t.bigint "system_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stargate_id"], name: "index_eve_stargates_on_stargate_id", unique: true
    t.index ["system_id"], name: "index_eve_stargates_on_system_id"
  end

  create_table "eve_systems", force: :cascade do |t|
    t.bigint "constellation_id"
    t.string "name"
    t.string "security_class"
    t.float "security_status"
    t.bigint "star_id"
    t.bigint "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_eve_systems_on_constellation_id"
    t.index ["star_id"], name: "index_eve_systems_on_star_id"
    t.index ["system_id"], name: "index_eve_systems_on_system_id", unique: true
  end

  create_table "eve_type_dogma_attributes", force: :cascade do |t|
    t.bigint "type_id"
    t.bigint "attribute_id"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eve_type_dogma_effects", force: :cascade do |t|
    t.bigint "type_id"
    t.bigint "effect_id"
    t.boolean "is_default"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eve_types", force: :cascade do |t|
    t.float "capacity"
    t.text "description"
    t.bigint "graphic_id"
    t.bigint "group_id"
    t.bigint "icon_id"
    t.bigint "market_group_id"
    t.float "mass"
    t.string "name"
    t.float "packaged_volume"
    t.integer "portion_size"
    t.boolean "published"
    t.float "radius"
    t.bigint "type_id"
    t.float "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_eve_types_on_type_id", unique: true
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "corporation_id"
    t.integer "loyalty_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "corporation_id"], name: "index_loyalty_points_on_character_id_and_corporation_id", unique: true
  end

  create_table "pghero_query_stats", force: :cascade do |t|
    t.text "database"
    t.text "user"
    t.text "query"
    t.bigint "query_hash"
    t.float "total_time"
    t.bigint "calls"
    t.datetime "captured_at"
    t.index ["database", "captured_at"], name: "index_pghero_query_stats_on_database_and_captured_at"
  end

  create_table "pghero_space_stats", force: :cascade do |t|
    t.text "database"
    t.text "schema"
    t.text "relation"
    t.bigint "size"
    t.datetime "captured_at"
    t.index ["database", "captured_at"], name: "index_pghero_space_stats_on_database_and_captured_at"
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "environment"
    t.text "certificate"
    t.string "password"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type", null: false
    t.string "auth_key"
    t.string "client_id"
    t.string "client_secret"
    t.string "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string "device_token", limit: 64, null: false
    t.datetime "failed_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "alert_is_json", default: false
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
    t.boolean "content_available", default: false
    t.text "notification"
    t.boolean "mutable_content", default: false
    t.index ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "device_token"
    t.integer "device_type"
    t.index ["token"], name: "index_sessions_on_token", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notifications_count", default: 0
    t.integer "kind", default: 0
    t.string "reset_password_token"
    t.index "lower((email)::text)", name: "index_users_on_LOWER_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "users"
  add_foreign_key "sessions", "users"
end
