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

ActiveRecord::Schema.define(version: 2022_04_11_181025) do

  create_table "items", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "image"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items_promo_campaigns", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "promo_campaign_id", null: false
    t.index ["item_id"], name: "index_items_promo_campaigns_on_item_id"
    t.index ["promo_campaign_id"], name: "index_items_promo_campaigns_on_promo_campaign_id"
  end

  create_table "promo_campaigns", force: :cascade do |t|
    t.string "name"
    t.text "rules"
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "campaign_type"
  end

end
