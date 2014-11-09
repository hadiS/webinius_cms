# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141008214307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "webinius_cms_languages", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webinius_cms_pages", force: true do |t|
    t.boolean  "status"
    t.string   "ancestry"
    t.string   "kind"
    t.integer  "position"
    t.string   "slug"
    t.hstore   "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "webinius_cms_pages", ["ancestry"], name: "index_webinius_cms_pages_on_ancestry", using: :btree
  add_index "webinius_cms_pages", ["properties"], name: "webinius_cms_pages_gin_properties", using: :gin

  create_table "webinius_cms_users", force: true do |t|
    t.string   "password_digest"
    t.string   "username"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
