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

ActiveRecord::Schema.define(version: 2019_04_21_144249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "steps", force: :cascade do |t|
    t.string "content"
    t.string "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "step_id"
    t.string "status"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "standing"
    t.string "experience"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "steps", "users"
end
