# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091123055557) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "lab_id",      :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name",       :limit => 96, :null => false
    t.string   "code",       :limit => 16, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficulties", :force => true do |t|
    t.string   "name",       :limit => 32, :null => false
    t.integer  "ordinal",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficultyquestions", :force => true do |t|
    t.integer  "difficulty_id", :null => false
    t.integer  "question_id",   :null => false
    t.integer  "user_id",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "effectivenesses", :force => true do |t|
    t.string   "name",       :limit => 32, :null => false
    t.integer  "ordinal",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "effectivenessquestions", :force => true do |t|
    t.integer  "effectiveness_id", :null => false
    t.integer  "question_id",      :null => false
    t.integer  "user_id",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labquestions", :force => true do |t|
    t.integer  "lab_id",      :null => false
    t.integer  "question_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labs", :force => true do |t|
    t.integer  "offering_id"
    t.integer  "user_id",                   :null => false
    t.string   "title",       :limit => 96, :null => false
    t.integer  "week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "question_id", :null => false
    t.integer  "user_id",     :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offerings", :force => true do |t|
    t.integer  "course_id",                      :null => false
    t.integer  "schoolquarter_id",               :null => false
    t.string   "section",          :limit => 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.string   "title",                          :null => false
    t.text     "body",                           :null => false
    t.text     "html"
    t.integer  "question_status", :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schoolquarters", :force => true do |t|
    t.string   "name",       :limit => 32, :null => false
    t.integer  "schoolyear",               :null => false
    t.integer  "quarter",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", :force => true do |t|
    t.integer  "question_id",                    :null => false
    t.integer  "user_id",                        :null => false
    t.string   "title",                          :null => false
    t.text     "body",                           :null => false
    t.text     "html"
    t.integer  "solution_status", :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                      :limit => 96,                   :null => false
    t.string   "login",                     :limit => 96,                   :null => false
    t.string   "email",                                                     :null => false
    t.string   "crypted_password",          :limit => 96,                   :null => false
    t.string   "salt",                      :limit => 96
    t.string   "remember_token",            :limit => 96
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 96
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 96
    t.boolean  "enabled",                                 :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
