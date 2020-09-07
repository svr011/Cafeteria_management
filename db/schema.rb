# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_05_072903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additems", force: :cascade do |t|
    t.string "item_name"
    t.string "item_description"
    t.bigint "item_cost"
    t.bigint "user_id"
    t.bigint "menu_id"
    t.boolean "is_breakfast"
    t.boolean "is_lunch"
    t.boolean "is_dinner"
  end

  create_table "billitems", force: :cascade do |t|
    t.string "item_name"
    t.bigint "item_cost"
    t.datetime "ordertime"
    t.bigint "user_id"
    t.bigint "quantity"
  end

  create_table "menuitems", force: :cascade do |t|
    t.string "item_name"
    t.string "item_description"
    t.bigint "item_cost"
    t.bigint "user_id"
    t.boolean "selected"
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orderitems", force: :cascade do |t|
    t.bigint "ordered_user_id"
    t.string "menu_item_name"
    t.bigint "menu_item_cost"
    t.bigint "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "delivered_at"
    t.boolean "confirmed"
    t.bigint "quantity"
    t.string "item_name"
    t.bigint "item_cost"
    t.datetime "order_time"
    t.bigint "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.boolean "is_owner"
    t.boolean "is_clerk"
    t.string "password_digest"
  end

end
