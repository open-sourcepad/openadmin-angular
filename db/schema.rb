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

ActiveRecord::Schema.define(version: 20160703122920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "establishment_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.integer  "review_count"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "source_link"
    t.text     "raw_object"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "ranking"
    t.float    "rating"
    t.text     "address"
    t.string   "internet"
    t.integer  "review_star_5"
    t.integer  "review_star_4"
    t.integer  "review_star_3"
    t.integer  "review_star_2"
    t.integer  "review_star_1"
    t.boolean  "hidden"
    t.string   "travel_time"
    t.text     "raw_travel_time"
    t.text     "raw_address"
    t.text     "raw_google_places"
    t.string   "google_places_id"
    t.integer  "neighbourhood_id"
    t.string   "slug"
    t.string   "mytype"
    t.string   "nearest_underground"
    t.text     "raw_nearest_underground"
    t.index ["slug"], name: "index_establishments_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.text     "raw_crime"
    t.integer  "crime_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slug"
    t.string   "ranking_crime"
    t.index ["slug"], name: "index_neighbourhoods_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "access_token"
    t.boolean  "is_active",          default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
