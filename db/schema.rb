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

ActiveRecord::Schema[7.0].define(version: 2023_07_14_202537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meditations", force: :cascade do |t|
    t.integer "total_sitting_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meditations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.boolean "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "password_digest"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "speaker"
    t.string "topic"
    t.string "length"
    t.string "date_recorded"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "embed_code"
    t.integer "vimeo_id"
    t.string "description"
    t.string "thumbnail_url"
  end

  add_foreign_key "meditations", "users"
end
