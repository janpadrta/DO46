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

ActiveRecord::Schema.define(version: 8) do

  create_table "users", force: true do |t|
    t.string   "email",                                                                    null: false
    t.string   "crypted_password",                                                         null: false
    t.string   "salt",                                                                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "failed_logins_count",                                      default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.string   "username"
    t.integer  "house_id"
    t.decimal  "solar",                           precision: 12, scale: 4, default: 0.0
    t.decimal  "melange",                         precision: 12, scale: 4, default: 0.0
    t.decimal  "exp",                             precision: 12, scale: 4, default: 0.0
    t.boolean  "admin",                                                    default: false
    t.boolean  "leader",                                                   default: false
    t.boolean  "emperor",                                                  default: false
    t.boolean  "arrakis",                                                  default: false
    t.boolean  "regent",                                                   default: false
    t.boolean  "vezir",                                                    default: false
    t.boolean  "court",                                                    default: false
    t.boolean  "mentat",                                                   default: false
    t.boolean  "army_mentat",                                              default: false
    t.boolean  "diplomat",                                                 default: false
    t.boolean  "senator",                                                  default: false
    t.boolean  "chairman",                                                 default: false
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["house_id"], name: "index_users_on_house_id"
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"
  add_index "users", ["username"], name: "index_users_on_username"

end
