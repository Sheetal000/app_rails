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

ActiveRecord::Schema[7.0].define(version: 2022_09_23_132340) do
  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "book_id", null: false
    t.integer "orders_id"
    t.integer "books_id"
    t.index ["books_id"], name: "index_books_orders_on_books_id"
    t.index ["orders_id"], name: "index_books_orders_on_orders_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.integer "visits"
    t.integer "order_count"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "date_submitted"
    t.integer "status"
    t.decimal "subtotal"
    t.decimal "shipping"
    t.decimal "tax"
    t.decimal "total"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books_orders", "books", column: "books_id"
  add_foreign_key "books_orders", "orders", column: "orders_id"
  add_foreign_key "orders", "customers"
end
