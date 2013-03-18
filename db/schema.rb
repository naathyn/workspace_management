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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130312082735) do

  create_table "directories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "directories", ["name"], :name => "index_directories_on_name", :unique => true

  create_table "documents", :force => true do |t|
    t.integer  "folder_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "documents", ["folder_id", "title"], :name => "index_documents_on_folder_id_and_title", :unique => true
  add_index "documents", ["folder_id"], :name => "index_documents_on_folder_id"
  add_index "documents", ["title"], :name => "index_documents_on_title"

  create_table "folders", :force => true do |t|
    t.integer  "directory_id"
    t.integer  "subfolder_id"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "folders", ["directory_id", "name"], :name => "index_folders_on_directory_id_and_name", :unique => true
  add_index "folders", ["directory_id"], :name => "index_folders_on_directory_id"
  add_index "folders", ["name"], :name => "index_folders_on_name"
  add_index "folders", ["subfolder_id", "name"], :name => "index_folders_on_subfolder_id_and_name", :unique => true
  add_index "folders", ["subfolder_id"], :name => "index_folders_on_subfolder_id"

end
