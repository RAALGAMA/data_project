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

ActiveRecord::Schema[7.0].define(version: 2023_10_06_045037) do
  create_table "games", force: :cascade do |t|
    t.integer "rank"
    t.string "name"
    t.string "genre"
    t.integer "publisher_id", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_games_on_Platform_id"
    t.index ["publisher_id"], name: "index_games_on_Publisher_id"
  end

  create_table "games_sales", force: :cascade do |t|
    t.integer "Games_id", null: false
    t.integer "Sale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Games_id"], name: "index_games_sales_on_Games_id"
    t.index ["Sale_id"], name: "index_games_sales_on_Sale_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.float "na_sales"
    t.float "eu_sales"
    t.float "jp_sales"
    t.float "other_sales"
    t.float "global_sales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "Platforms", column: "platform_id"
  add_foreign_key "games", "Publishers", column: "publisher_id"
  add_foreign_key "games_sales", "Games", column: "Games_id"
  add_foreign_key "games_sales", "Sales"
end
