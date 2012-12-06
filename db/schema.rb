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

ActiveRecord::Schema.define(:version => 20121205221245) do

  create_table "allergies", :force => true do |t|
    t.string   "name"
    t.text     "warning_text"
    t.boolean  "active"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "student_id"
    t.integer  "event_id"
    t.boolean  "exempt"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.date     "date"
    t.integer  "program_id"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "location_id"
    t.boolean  "gospel_shared"
    t.integer  "meals_served",       :default => 0
    t.integer  "bibles_distributed", :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "guardians", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "household_id"
    t.string   "guardian_type"
    t.string   "cell_phone"
    t.boolean  "can_text"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "households", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "zip"
    t.string   "insurance_company"
    t.string   "insurance_number"
    t.string   "church"
    t.float    "lat"
    t.float    "lon"
    t.boolean  "active"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.float    "lat"
    t.float    "lon"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.text     "contents"
    t.string   "notable_type"
    t.integer  "notable_id"
    t.integer  "priority"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "title"
    t.boolean  "active",       :default => true
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "department_id"
    t.integer  "min_grade"
    t.integer  "max_grade"
    t.integer  "max_capacity"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "scan_by_absence", :default => false
  end

  create_table "section_events", :force => true do |t|
    t.integer  "section_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "max_capacity"
    t.boolean  "active"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "program_id"
  end

  create_table "student_allergies", :force => true do |t|
    t.integer  "student_id"
    t.integer  "allergy_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "barcode_number"
    t.integer  "household_id"
    t.boolean  "is_male"
    t.integer  "grade"
    t.date     "date_of_birth"
    t.string   "cell_phone"
    t.boolean  "can_text"
    t.string   "photo"
    t.string   "email"
    t.string   "status"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "is_visitor",          :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "role"
    t.integer  "department_id"
    t.boolean  "active"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
