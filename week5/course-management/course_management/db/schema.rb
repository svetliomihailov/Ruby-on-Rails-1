# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150430170306) do

  create_table "lectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "body",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "task_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["task_id"], name: "index_solutions_on_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "lecture_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["lecture_id"], name: "index_tasks_on_lecture_id", using: :btree

end
