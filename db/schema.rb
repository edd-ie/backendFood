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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_142830) do
  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "phone"
    t.boolean "policy"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fav_foods", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fav_restaurants", force: :cascade do |t|
    t.string "restaurant_id"
    t.string "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "food_id"
    t.integer "customer_id"
    t.integer "like"
    t.integer "dislike"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "ingredients"
    t.integer "price"
    t.integer "discount"
    t.integer "restaurant_id"
    t.boolean "vegetarian"
    t.boolean "allergen"
    t.float "ratings"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "item"
    t.integer "quantity"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loyalties", force: :cascade do |t|
    t.integer "points"
    t.integer "customer_id"
    t.integer "restaurant_id"
    t.boolean "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_tracks", force: :cascade do |t|
    t.string "status"
    t.integer "order_id"
    t.integer "restaurant_id"
    t.integer "staff_id"
    t.integer "chef_id"
    t.boolean "paid"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "items"
  end

  create_table "orders", force: :cascade do |t|
    t.text "items"
    t.text "food_id"
    t.integer "customer_id"
    t.integer "restaurant_id"
    t.float "latitude"
    t.float "longitude"
    t.float "discount"
    t.integer "service_fee"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "restaurant_id"
    t.integer "customer_id"
    t.integer "like"
    t.integer "dislike"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "phone"
    t.boolean "policy"
    t.integer "pay_bill"
    t.integer "acc_num"
    t.integer "till_num"
    t.string "ambience"
    t.string "cuisine"
    t.string "price_range"
    t.float "latitude"
    t.float "longitude"
    t.float "ratings"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.integer "restaurant_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
