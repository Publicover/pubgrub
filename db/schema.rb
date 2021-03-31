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

ActiveRecord::Schema.define(version: 2021_03_31_131558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "condiments", force: :cascade do |t|
    t.string "name"
    t.decimal "calories_per_gram", precision: 4, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_condiments_on_name", unique: true
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cuisines_on_name", unique: true
  end

  create_table "entrees", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_sides"
    t.integer "present_sides", default: [], array: true
    t.integer "side_category_ids", default: [], array: true
    t.integer "status", default: 0
    t.bigint "cuisine_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "calories_per_gram", precision: 4, scale: 2
    t.index ["cuisine_id"], name: "index_entrees_on_cuisine_id"
    t.index ["name"], name: "index_entrees_on_name", unique: true
    t.index ["user_id"], name: "index_entrees_on_user_id"
  end

  create_table "food_logs", force: :cascade do |t|
    t.decimal "entree_calories", precision: 6, scale: 2
    t.decimal "side_calories", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entree_id", null: false
    t.integer "side_ids", default: [], array: true
    t.index ["entree_id"], name: "index_food_logs_on_entree_id"
    t.index ["user_id"], name: "index_food_logs_on_user_id"
  end

  create_table "groceries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "calories_per_gram", precision: 5, scale: 2
    t.integer "calories_per_package"
    t.integer "grams_per_package"
    t.index ["name"], name: "index_groceries_on_name", unique: true
  end

  create_table "grocery_lists", force: :cascade do |t|
    t.jsonb "grocery_quantity", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "entree_ids", default: [], array: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.decimal "quantity", precision: 5, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ingredientable_type", null: false
    t.bigint "ingredientable_id", null: false
    t.string "measurement", default: "Whole"
    t.integer "status", default: 1
    t.bigint "grocery_id", null: false
    t.integer "total_grams"
    t.index ["grocery_id"], name: "index_ingredients_on_grocery_id"
    t.index ["ingredientable_type", "ingredientable_id"], name: "index_ingredients_on_ingredientable"
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "entree_id", null: false
    t.integer "side_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entree_id"], name: "index_meals_on_entree_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.string "measure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recipeable_type", null: false
    t.bigint "recipeable_id", null: false
    t.index ["recipeable_type", "recipeable_id"], name: "index_recipes_on_recipeable"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "side_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_side_categories_on_name", unique: true
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.bigint "user_id", null: false
    t.bigint "side_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "calories_per_gram", precision: 4, scale: 2
    t.index ["name"], name: "index_sides_on_name", unique: true
    t.index ["side_category_id"], name: "index_sides_on_side_category_id"
    t.index ["user_id"], name: "index_sides_on_user_id"
  end

  create_table "staples", force: :cascade do |t|
    t.integer "quantity"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "calories_per_package"
    t.integer "grams_per_package"
    t.bigint "grocery_id", null: false
    t.bigint "measurement_id", null: false
    t.index ["grocery_id"], name: "index_staples_on_grocery_id"
    t.index ["measurement_id"], name: "index_staples_on_measurement_id"
    t.index ["user_id"], name: "index_staples_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "fname"
    t.integer "role", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "calorie_goal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "entrees", "cuisines"
  add_foreign_key "entrees", "users"
  add_foreign_key "food_logs", "entrees"
  add_foreign_key "food_logs", "users"
  add_foreign_key "ingredients", "groceries"
  add_foreign_key "meals", "entrees"
  add_foreign_key "recipes", "users"
  add_foreign_key "sides", "side_categories"
  add_foreign_key "sides", "users"
  add_foreign_key "staples", "groceries"
  add_foreign_key "staples", "measurements"
  add_foreign_key "staples", "users"
end
