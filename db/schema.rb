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

ActiveRecord::Schema[7.0].define(version: 2024_04_07_054547) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "address"
    t.string "state"
    t.integer "pincode"
    t.string "city"
    t.string "country"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "amount"
    t.date "order_date"
    t.integer "payment_id"
    t.bigint "customer_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
  end

  create_table "platform_api_calls", force: :cascade do |t|
    t.string "requested_url"
    t.text "requested_data"
    t.text "response_data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_platform_api_calls_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "address"
    t.string "state"
    t.integer "pincode"
    t.string "city"
    t.string "country"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sellers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.integer "user_type", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "sellers"
  add_foreign_key "platform_api_calls", "users"
  add_foreign_key "sellers", "users"
end
