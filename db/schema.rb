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

ActiveRecord::Schema.define(version: 20170223150427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "available_datetime"
    t.integer  "portions"
    t.integer  "dish_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "left_portions"
    t.index ["dish_id"], name: "index_availabilities_on_dish_id", using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "gluten_free"
    t.boolean  "vegetarian"
    t.boolean  "bio"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "price"
    t.index ["user_id"], name: "index_dishes_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "portions"
    t.text     "review_description"
    t.integer  "review_rating"
    t.integer  "user_id"
    t.integer  "availability_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["availability_id"], name: "index_orders_on_availability_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availabilities", "dishes"
  add_foreign_key "dishes", "users"
  add_foreign_key "orders", "availabilities"
  add_foreign_key "orders", "users"
end
