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

ActiveRecord::Schema.define(:version => 20101216221620) do

  create_table "assigments", :force => true do |t|
    t.integer  "job_id"
    t.integer  "worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", :force => true do |t|
    t.decimal  "price"
    t.string   "pricing_method"
    t.text     "comments"
    t.integer  "job_id"
    t.integer  "worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.integer  "user_id"
    t.string   "phone"
    t.string   "pay_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.date     "start_time"
    t.date     "end_time"
    t.date     "project_begin"
    t.date     "project_finish"
    t.string   "location"
    t.decimal  "budget"
    t.string   "pricing_method"
    t.string   "service_contact"
    t.string   "buyers_support_contact"
    t.string   "state"
    t.integer  "employer_id"
    t.integer  "category_id"
    t.integer  "visitor_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "budget_porcentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ofertas", :force => true do |t|
    t.string   "link"
    t.string   "nombre"
    t.text     "desc"
    t.datetime "empieza"
    t.datetime "termina"
    t.decimal  "precio"
    t.decimal  "ahorro"
    t.integer  "ofertas_actuales"
    t.integer  "ofertas_requeridas"
    t.text     "bases"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_workers", :force => true do |t|
    t.integer  "skill_id"
    t.integer  "worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.string   "perishable_token"
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.boolean  "admin"
    t.boolean  "active"
    t.string   "owner_type"
    t.integer  "owner_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "workers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "country"
    t.string   "business_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "company_phone"
    t.string   "website_url"
    t.string   "number_employees"
    t.integer  "year_comp_founded"
    t.string   "stock_parts"
    t.string   "company_logo"
    t.text     "company_background"
    t.text     "detailed_service_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
