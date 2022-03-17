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

ActiveRecord::Schema.define(version: 2022_03_03_160009) do

  create_table "disks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number_of_songs", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "number"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_ratings_on_song_id"
  end

  create_table "singers", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.integer "age", null: false
    t.string "status", null: false
    t.string "country", null: false
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_singers_on_group_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.string "text", null: false
    t.integer "group_id"
    t.integer "disk_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disk_id"], name: "index_songs_on_disk_id"
    t.index ["group_id"], name: "index_songs_on_group_id"
  end

  add_foreign_key "ratings", "songs", on_delete: :cascade
  add_foreign_key "singers", "groups", on_delete: :cascade
  add_foreign_key "songs", "disks", on_delete: :cascade
  add_foreign_key "songs", "groups", on_delete: :cascade
end
