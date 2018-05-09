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

ActiveRecord::Schema.define(version: 20180504220041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Franchise", primary_key: "franchiseID", id: :serial, force: :cascade do |t|
    t.string "franchiseName", limit: 100
    t.text "description"
    t.string "picture", limit: 300
  end

  create_table "IComments", primary_key: "commentId", id: :serial, force: :cascade do |t|
    t.string "displayName", limit: 100
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
  end

  create_table "IRating", primary_key: "ratingID", id: :serial, force: :cascade do |t|
    t.integer "overallRating"
    t.integer "individualRating"
    t.integer "issueID"
  end

  create_table "Issue", primary_key: "issueID", id: :serial, force: :cascade do |t|
    t.string "issueName", limit: 100
    t.integer "seriesID"
    t.integer "volumeID"
    t.string "cover", limit: 100
    t.string "author", limit: 100
    t.string "editor", limit: 100
    t.string "synopsis", limit: 100
    t.string "summary", limit: 100
    t.string "tags", limit: 100, array: true
    t.string "characters", limit: 100, array: true
    t.string "artist", limit: 100
    t.json "data"
  end

  create_table "Publisher", primary_key: "publisherID", id: :serial, force: :cascade do |t|
    t.string "publisherName", limit: 100
    t.text "description"
    t.string "picture", limit: 300
  end

  create_table "SComments", primary_key: "commentId", id: :serial, force: :cascade do |t|
    t.string "displayName", limit: 100
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
  end

  create_table "SRating", primary_key: "ratingID", id: :serial, force: :cascade do |t|
    t.integer "overallRating"
    t.integer "individualRating"
    t.integer "seriesID"
  end

  create_table "Series", primary_key: "seriesID", id: :serial, force: :cascade do |t|
    t.string "seriesName", limit: 100
    t.string "volumeName", limit: 100
    t.string "picture", limit: 300
    t.integer "publisherID"
    t.integer "franchiseID"
  end

  create_table "User", primary_key: "userID", id: :serial, force: :cascade do |t|
    t.string "username", limit: 100
    t.string "password", limit: 100
    t.string "displayName", limit: 100
    t.string "profilePic", limit: 300
    t.string "personalBio", limit: 100
    t.string "privilege", limit: 100
    t.string "friendList", limit: 100
    t.string "passwordConfirm", limit: 100
    t.string "email", limit: 150
    t.string "password_digest", limit: 300
  end

  create_table "VComments", primary_key: "commentId", id: :serial, force: :cascade do |t|
    t.string "displayName", limit: 100
    t.text "body"
    t.date "date", default: -> { "('now'::text)::date" }, null: false
  end

  create_table "VRating", primary_key: "ratingID", id: :serial, force: :cascade do |t|
    t.integer "overallRating"
    t.integer "individualRating"
    t.integer "volumeID"
  end

  create_table "Volume", primary_key: "volumeID", id: :serial, force: :cascade do |t|
    t.string "volumeName", limit: 100
    t.string "issueName", limit: 100
    t.integer "seriesID"
  end

end
