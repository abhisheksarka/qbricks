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

ActiveRecord::Schema.define(version: 2019_02_14_111415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string "expression", null: false
    t.string "conditionable_type", null: false
    t.bigint "conditionable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conditionable_type", "conditionable_id"], name: "index_conditions_on_conditionable_type_and_conditionable_id"
    t.index ["expression"], name: "index_conditions_on_expression"
  end

  create_table "datasets", force: :cascade do |t|
    t.jsonb "content"
    t.string "type"
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_datasets_on_site_id"
  end

  create_table "flows", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_flows_on_name"
    t.index ["site_id"], name: "index_flows_on_site_id"
  end

  create_table "flows_steps", force: :cascade do |t|
    t.bigint "flow_id"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_flows_steps_on_flow_id"
    t.index ["step_id"], name: "index_flows_steps_on_step_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.jsonb "config", null: false
    t.jsonb "datamap", null: false
    t.string "domain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_sites_on_code"
    t.index ["domain"], name: "index_sites_on_domain"
    t.index ["name"], name: "index_sites_on_name"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.string "name", null: false
    t.string "step_type", null: false
    t.jsonb "config", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_steps_on_name"
    t.index ["site_id"], name: "index_steps_on_site_id"
    t.index ["step_type"], name: "index_steps_on_step_type"
  end

  add_foreign_key "datasets", "sites"
  add_foreign_key "flows", "sites"
  add_foreign_key "flows_steps", "flows"
  add_foreign_key "flows_steps", "steps"
  add_foreign_key "steps", "sites"
end
