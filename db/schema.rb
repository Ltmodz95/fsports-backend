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

ActiveRecord::Schema[8.0].define(version: 2025_05_13_145015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_components_on_product_id"
  end

  create_table "incompatablity_rules", force: :cascade do |t|
    t.integer "first_option_id"
    t.integer "second_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_option_id", "second_option_id"], name: "index_incompatability_rules_on_options", unique: true
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.boolean "in_stock"
    t.bigint "component_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "first_option_id"
    t.bigint "second_option_id"
    t.index ["component_id"], name: "index_options_on_component_id"
    t.index ["first_option_id", "second_option_id"], name: "index_options_on_first_option_id_and_second_option_id", unique: true
    t.index ["first_option_id"], name: "index_options_on_first_option_id"
    t.index ["second_option_id"], name: "index_options_on_second_option_id"
  end

  create_table "price_adjustments", force: :cascade do |t|
    t.bigint "first_option_id"
    t.bigint "second_option_id"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_option_id", "second_option_id"], name: "idx_on_first_option_id_second_option_id_e030455904", unique: true
    t.index ["first_option_id"], name: "index_price_adjustments_on_first_option_id"
    t.index ["second_option_id"], name: "index_price_adjustments_on_second_option_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "base_price"
    t.boolean "in_stock"
    t.string "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "components", "products"
  add_foreign_key "incompatablity_rules", "options", column: "first_option_id"
  add_foreign_key "incompatablity_rules", "options", column: "second_option_id"
  add_foreign_key "options", "components"
  add_foreign_key "options", "options", column: "first_option_id"
  add_foreign_key "options", "options", column: "second_option_id"
  add_foreign_key "price_adjustments", "options", column: "first_option_id"
  add_foreign_key "price_adjustments", "options", column: "second_option_id"
  add_foreign_key "products", "categories"
end
