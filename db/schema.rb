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

ActiveRecord::Schema.define(:version => 20121004060933) do

  create_table "attendences", :force => true do |t|
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

  create_table "events", :force => true do |t|
    t.date     "date"
    t.integer  "program_id"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "location_id"
    t.boolean  "gospel_shared"
    t.integer  "meals_served"
    t.integer  "bibles_distributed"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "max_capacity"
    t.boolean  "active"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "department_id"
    t.integer  "min_grade"
    t.integer  "max_grade"
    t.integer  "max_capacity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "active"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "student_id"
    t.integer  "program_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
