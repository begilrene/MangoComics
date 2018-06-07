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

ActiveRecord::Schema.define(version: 20180508181229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Franchise", primary_key: "franchiseID", id: :serial, force: :cascade do |t|
    t.string "franchisename", limit: 100
    t.text "description"
    t.string "picture", limit: 300
    t.integer "publisher_id"
  end

  create_table "Issue", primary_key: "issueID", id: :serial, force: :cascade do |t|
    t.string "issuename", limit: 100
    t.string "cover", limit: 400
    t.text "synopsis"
    t.text "summary"
    t.json "data"
    t.integer "volume_id"
    t.string "artist", limit: 200
    t.string "author", limit: 500
    t.string "editor", limit: 500
    t.text "characters"
    t.string "tags"
  end

  create_table "MComment", primary_key: "commentId", id: :integer, default: -> { "nextval('\"SComments_commentId_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "displayName", limit: 100
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
    t.integer "pageIndex"
    t.integer "userID"
    t.integer "user_id"
    t.integer "new_id"
  end

  create_table "New", primary_key: "newsId", id: :integer, default: -> { "nextval('\"new_newsId_seq\"'::regclass)" }, force: :cascade do |t|
    t.text "author", default: "Donald Bui"
    t.text "body"
    t.text "image"
    t.text "link"
    t.text "title"
  end

  create_table "Publisher", primary_key: "publisherID", id: :serial, force: :cascade do |t|
    t.string "publisherName", limit: 100
    t.text "description"
    t.string "picture", limit: 300
  end

  create_table "Review", primary_key: "reviewid", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "volume_id"
    t.integer "issue_id"
    t.integer "series_id"
    t.integer "user_id"
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }
  end

  create_table "SComments", primary_key: "commentId", id: :serial, force: :cascade do |t|
    t.string "displayName", limit: 100
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
  end

  create_table "Series", primary_key: "seriesID", id: :serial, force: :cascade do |t|
    t.string "seriesname", limit: 100
    t.string "picture", limit: 300
    t.integer "franchise_id"
  end

  create_table "User", primary_key: "userID", id: :serial, force: :cascade do |t|
    t.string "firstname", limit: 100
    t.string "password", limit: 100
    t.string "displayName", limit: 100
    t.string "profilePic", limit: 300, default: "https://cdn.discordapp.com/attachments/431136930013511681/431613336887492618/mango.png"
    t.string "personalBio", limit: 100
    t.string "privilege", limit: 100
    t.string "lastname", limit: 100
    t.string "passwordConfirm", limit: 100
    t.string "email", limit: 150
    t.string "password_digest", limit: 300
    t.integer "permission", default: 0
  end

  create_table "Volume", primary_key: "volumeID", id: :serial, force: :cascade do |t|
    t.integer "series_id"
    t.text "volumename", comment: "Stores the name of the volume"
    t.text "picture"
  end

  create_table "comments", primary_key: "commentId", id: :integer, default: -> { "nextval('\"IComments_commentId_seq\"'::regclass)" }, force: :cascade do |t|
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
    t.integer "userid"
    t.integer "issueID"
    t.integer "user_id"
    t.integer "issue_id"
    t.integer "wall_id"
    t.integer "volume_id"
    t.integer "series_id"
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }
    t.integer "new_id"
  end

  create_table "flist", id: :serial, force: :cascade do |t|
    t.integer "followid", null: false
    t.integer "user_id"
  end

  create_table "rating", primary_key: "ratingID", id: :integer, default: -> { "nextval('\"IRating_ratingID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "rating"
    t.integer "issue_id"
    t.integer "user_id"
    t.datetime "created_at", default: -> { "timezone('utc'::text, now())" }
    t.integer "volume_id"
    t.integer "series_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "Franchise", "\"Publisher\"", column: "publisher_id", primary_key: "publisherID", name: "Franchise_publisher_id_fkey"
  add_foreign_key "Issue", "\"Volume\"", column: "volume_id", primary_key: "volumeID", name: "Issue_volume_id_fkey"
  add_foreign_key "MComment", "\"New\"", column: "new_id", primary_key: "newsId", name: "MComment_new_id_fkey"
  add_foreign_key "MComment", "\"User\"", column: "user_id", primary_key: "userID", name: "MComment_user_id_fkey"
  add_foreign_key "Review", "\"Issue\"", column: "issue_id", primary_key: "issueID", name: "Review_issue_id_fkey"
  add_foreign_key "Review", "\"Series\"", column: "series_id", primary_key: "seriesID", name: "Review_series_id_fkey"
  add_foreign_key "Review", "\"User\"", column: "user_id", primary_key: "userID", name: "Review_user_id_fkey"
  add_foreign_key "Review", "\"Volume\"", column: "volume_id", primary_key: "volumeID", name: "Review_volume_id_fkey"
  add_foreign_key "Series", "\"Franchise\"", column: "franchise_id", primary_key: "franchiseID", name: "Series_franchise_id_fkey"
  add_foreign_key "Volume", "\"Series\"", column: "series_id", primary_key: "seriesID", name: "Volume_series_id_fkey"
  add_foreign_key "comments", "\"Issue\"", column: "issue_id", primary_key: "issueID", name: "IComments_location_fkey"
  add_foreign_key "comments", "\"New\"", column: "new_id", primary_key: "newsId", name: "comments_new_id_fkey"
  add_foreign_key "comments", "\"Series\"", column: "series_id", primary_key: "seriesID", name: "comments_series_id_fkey"
  add_foreign_key "comments", "\"User\"", column: "user_id", primary_key: "userID", name: "IComments_commenter_fkey"
  add_foreign_key "comments", "\"User\"", column: "wall_id", primary_key: "userID", name: "comments_wall_id_fkey"
  add_foreign_key "comments", "\"Volume\"", column: "volume_id", primary_key: "volumeID", name: "comments_volume_id_fkey"
  add_foreign_key "flist", "\"User\"", column: "followid", primary_key: "userID", name: "flist_followid_fkey"
  add_foreign_key "rating", "\"Issue\"", column: "issue_id", primary_key: "issueID", name: "IRating_issue_id_fkey"
  add_foreign_key "rating", "\"Series\"", column: "series_id", primary_key: "seriesID", name: "rating_series_id_fkey"
  add_foreign_key "rating", "\"User\"", column: "user_id", primary_key: "userID", name: "IRating_user_id_fkey"
  add_foreign_key "rating", "\"Volume\"", column: "volume_id", primary_key: "volumeID", name: "rating_volume_id_fkey"
end
