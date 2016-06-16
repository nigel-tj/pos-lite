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

ActiveRecord::Schema.define(version: 20160606132712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "published",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "halls", force: :cascade do |t|
    t.string   "name"
    t.string   "rows"
    t.integer  "init_seat_num"
    t.text     "structure"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "item_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "stock_amount"
    t.integer  "amount_sold",                              default: 0
    t.decimal  "cost_price",       precision: 8, scale: 2
    t.boolean  "published",                                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_category_id"
    t.string   "thumbnail"
    t.datetime "showtime"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "quantity",                            default: 1
    t.decimal  "price",       precision: 8, scale: 2
    t.decimal  "total_price", precision: 8, scale: 2
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "sale_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal  "amount",           precision: 8, scale: 2
    t.decimal  "total_amount",     precision: 8, scale: 2
    t.decimal  "remaining_amount"
    t.decimal  "discount",         precision: 8, scale: 2
    t.decimal  "tax",              precision: 8, scale: 2
    t.integer  "customer_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seats", force: :cascade do |t|
    t.string   "number"
    t.string   "location"
    t.string   "price"
    t.boolean  "booked"
    t.integer  "hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_configurations", force: :cascade do |t|
    t.string   "store_name"
    t.text     "store_description"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "website_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "currency"
    t.decimal  "tax_rate",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                 default: "",    null: false
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "can_update_users",         default: false
    t.boolean  "can_update_items",         default: true
    t.boolean  "can_update_configuration", default: false
    t.boolean  "can_view_reports",         default: false
    t.boolean  "can_update_sale_discount", default: false
    t.boolean  "can_remove_sales",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
