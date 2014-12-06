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

ActiveRecord::Schema.define(version: 20141206192658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concentrates", force: true do |t|
    t.string   "strain"
    t.string   "fees"
    t.string   "kind"
    t.string   "quantity_price"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concentrates", ["merchant_id"], name: "index_concentrates_on_merchant_id", using: :btree
  add_index "concentrates", ["strain"], name: "index_concentrates_on_strain", using: :btree

  create_table "edibles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "price"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "display",     default: true
  end

  add_index "edibles", ["merchant_id"], name: "index_edibles_on_merchant_id", using: :btree
  add_index "edibles", ["name"], name: "index_edibles_on_name", using: :btree

  create_table "equipment", force: true do |t|
    t.string   "item"
    t.text     "description"
    t.string   "kind"
    t.string   "price"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipment", ["merchant_id"], name: "index_equipment_on_merchant_id", using: :btree

  create_table "flowers", force: true do |t|
    t.string   "strain"
    t.string   "kind"
    t.text     "description"
    t.string   "quantity_price"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "display",        default: true
  end

  add_index "flowers", ["strain"], name: "index_flowers_on_strain", using: :btree

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.boolean  "premium",     default: false
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchants", ["merchant_id"], name: "index_merchants_on_merchant_id", using: :btree
  add_index "merchants", ["name"], name: "index_merchants_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
