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

ActiveRecord::Schema.define(version: 20171127140056) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "view_count", default: 0
  end

  create_table "categories_sources", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "source_id"
    t.index ["category_id"], name: "index_categories_sources_on_category_id"
    t.index ["source_id"], name: "index_categories_sources_on_source_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.index ["feed_id"], name: "index_comments_on_feed_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "description"
    t.string "image"
    t.string "city"
    t.string "street"
    t.integer "event_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "description"
    t.string "date"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_id"
    t.string "full_description"
    t.datetime "data_time"
    t.integer "view_count", default: 0
    t.index ["source_id"], name: "index_feeds_on_source_id"
  end

  create_table "feeds_users", id: false, force: :cascade do |t|
    t.integer "feed_id"
    t.integer "user_id"
    t.index ["feed_id"], name: "index_feeds_users_on_feed_id"
    t.index ["user_id"], name: "index_feeds_users_on_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "name"
    t.string "date_time"
    t.string "title"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password"
    t.string "api_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description_url"
    t.string "image_url"
    t.boolean "default_source", default: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "text"
    t.string "url"
    t.string "full_text"
    t.string "user_name"
    t.string "tweet_id"
    t.string "user_url"
    t.string "user_screen_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "profile_image_url"
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.string "nick_name"
    t.string "sourse_mass_id"
    t.datetime "last_visit"
    t.boolean "admin", default: false
    t.boolean "create_feed", default: false
    t.boolean "ban", default: false
    t.string "twitter_token"
    t.string "twitter_token_secret"
    t.string "role", default: "reader"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
