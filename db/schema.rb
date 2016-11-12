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

ActiveRecord::Schema.define(version: 20161112174011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "learning_materials", force: :cascade do |t|
    t.integer  "node_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["node_id"], name: "index_learning_materials_on_node_id", using: :btree
  end

  create_table "nodes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "requirements",      default: [],                 array: true
    t.integer  "depth"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "tree_id"
    t.integer  "column_number"
    t.string   "full_name"
    t.boolean  "completed",         default: false, null: false
    t.index ["tree_id"], name: "index_nodes_on_tree_id", using: :btree
  end

  create_table "trees", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  add_foreign_key "learning_materials", "nodes"
  add_foreign_key "nodes", "trees"
end
