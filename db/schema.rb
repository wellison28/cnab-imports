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

ActiveRecord::Schema.define(version: 2020_08_16_004146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recipients", force: :cascade do |t|
    t.string "cpf", limit: 11, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_recipients_on_cpf", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "owner_name", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_stores_on_name", unique: true
  end

  create_table "transaction_types", force: :cascade do |t|
    t.integer "kind", limit: 2, null: false
    t.string "description", limit: 30, null: false
    t.integer "operation", limit: 2, null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.date "date"
    t.decimal "amount"
    t.string "card"
    t.time "hour"
    t.bigint "recipient_id", null: false
    t.bigint "store_id", null: false
    t.bigint "transaction_type_id", null: false
    t.datetime "created_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["recipient_id"], name: "index_transactions_on_recipient_id"
    t.index ["store_id"], name: "index_transactions_on_store_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

  add_foreign_key "transactions", "recipients"
  add_foreign_key "transactions", "stores"
  add_foreign_key "transactions", "transaction_types"
end
