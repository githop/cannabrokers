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

ActiveRecord::Schema.define(version: 20140928170652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concentrates", force: true do |t|
    t.string   "strain"
    t.string   "fees"
    t.string   "kind"
    t.string   "quantity_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concentrates", ["strain"], name: "index_concentrates_on_strain", using: :btree

  create_table "edibles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "edibles", ["name"], name: "index_edibles_on_name", using: :btree

  create_table "flowers", force: true do |t|
    t.string   "strain"
    t.string   "kind"
    t.text     "description"
    t.string   "quantity_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flowers", ["strain"], name: "index_flowers_on_strain", using: :btree

  create_table "inventories", force: true do |t|
    t.integer  "flower_id"
    t.integer  "concentrate_id"
    t.integer  "edible_id"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventories", ["concentrate_id"], name: "index_inventories_on_concentrate_id", using: :btree
  add_index "inventories", ["edible_id"], name: "index_inventories_on_edible_id", using: :btree
  add_index "inventories", ["flower_id"], name: "index_inventories_on_flower_id", using: :btree
  add_index "inventories", ["merchant_id"], name: "index_inventories_on_merchant_id", using: :btree

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["name"], name: "index_merchants_on_name", using: :btree

end
