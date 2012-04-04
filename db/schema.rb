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

ActiveRecord::Schema.define(:version => 20120330185626) do

  create_table "discipline_block_groups", :force => true do |t|
    t.integer  "discipline_year_block_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discipline_group_tests", :id => false, :force => true do |t|
    t.integer "test_id"
    t.integer "discipline_year_block_id"
  end

  create_table "discipline_year_blocks", :force => true do |t|
    t.integer  "discipline_id"
    t.string   "year"
    t.integer  "block_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines_repository_themes", :id => false, :force => true do |t|
    t.integer "discipline_id"
    t.integer "repository_theme_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repository_themes", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "script_sub_themes", :force => true do |t|
    t.string   "name"
    t.integer  "start_num"
    t.integer  "end_num"
    t.integer  "questions_to_pass"
    t.integer  "questions_count"
    t.boolean  "order_questions"
    t.integer  "script_theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "script_themes", :force => true do |t|
    t.string   "name"
    t.integer  "repository_theme_id"
    t.integer  "questions_to_pass"
    t.integer  "subthemes_to_pass"
    t.boolean  "order_subthemes"
    t.integer  "script_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scripts", :force => true do |t|
    t.string   "name"
    t.string   "redirect_page"
    t.integer  "time"
    t.boolean  "blocked"
    t.boolean  "order_themes"
    t.integer  "questions_to_pass"
    t.integer  "themes_to_pass"
    t.integer  "results"
    t.integer  "test_id"
    t.integer  "base_script_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.integer "discipline_id"
    t.integer "group_id"
    t.string  "year"
    t.integer "bloc"
  end

  create_table "subjects_tests", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "test_id"
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.boolean  "necessary"
    t.boolean  "block"
    t.integer  "num_try"
    t.integer  "period"
    t.integer  "test_type"
    t.integer  "auth_type"
    t.boolean  "w_key"
    t.boolean  "ext_access"
    t.boolean  "msiu_access"
    t.integer  "order"
    t.datetime "scheduled_date"
    t.integer  "scheduled_pair"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.integer  "role",                                     :default => 0
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
