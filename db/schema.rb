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

ActiveRecord::Schema[8.1].define(version: 2026_02_15_102730) do
  create_table "anime_entries", force: :cascade do |t|
    t.integer "anilist_id"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.integer "episodes"
    t.boolean "featured_in_sidebar", default: false
    t.string "format"
    t.string "list_status"
    t.float "mean_score"
    t.string "media_status"
    t.integer "progress"
    t.integer "score"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "visible"
    t.index ["anilist_id", "user_id"], name: "index_anime_entries_on_anilist_id_and_user_id", unique: true
    t.index ["featured_in_sidebar"], name: "index_anime_entries_on_featured_in_sidebar"
    t.index ["user_id"], name: "index_anime_entries_on_user_id"
  end

  create_table "animes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "list_status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "visible"
    t.index ["user_id"], name: "index_animes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "post_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "manga_entries", force: :cascade do |t|
    t.integer "anilist_id"
    t.integer "chapters"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.string "format"
    t.string "list_status"
    t.float "mean_score"
    t.string "media_status"
    t.integer "progress"
    t.integer "score"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "visible"
    t.integer "volumes"
    t.index ["anilist_id", "user_id"], name: "index_manga_entries_on_anilist_id_and_user_id", unique: true
    t.index ["user_id"], name: "index_manga_entries_on_user_id"
  end

  create_table "media", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "list_status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "visible"
    t.index ["user_id"], name: "index_media_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_subscribers_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.string "anilist_username"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "newsletter"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anime_entries", "users"
  add_foreign_key "animes", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "manga_entries", "users"
  add_foreign_key "media", "users"
  add_foreign_key "posts", "users"
end
