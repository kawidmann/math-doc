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

ActiveRecord::Schema.define(version: 20160524233900) do

  create_table "problems", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "date"
    t.string   "problem_type"
    t.integer  "total",        default: 0
    t.integer  "correct",      default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                        default: "",    null: false
    t.string   "encrypted_password",                           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "teacher_id"
    t.boolean  "numbers_identifying",                          default: false
    t.integer  "numbers_identifying_percent"
    t.integer  "numbers_identifying_mastery"
    t.boolean  "numbers_counting",                             default: false
    t.integer  "numbers_counting_percent"
    t.integer  "numbers_counting_mastery"
    t.boolean  "numbers_rote_counting",                        default: false
    t.integer  "numbers_rote_counting_percent"
    t.integer  "numbers_rote_counting_mastery"
    t.boolean  "addition",                                     default: false
    t.integer  "addition_percent"
    t.integer  "addition_mastery"
    t.integer  "addition_digits"
    t.boolean  "addition_grouping",                            default: false
    t.boolean  "subtraction",                                  default: false
    t.integer  "subtraction_percent"
    t.integer  "subtraction_mastery"
    t.integer  "subtraction_digits"
    t.boolean  "subtraction_grouping",                         default: false
    t.boolean  "multiplication",                               default: false
    t.integer  "multiplication_percent"
    t.integer  "multiplication_mastery"
    t.integer  "multiplication_digits"
    t.integer  "multiplication_max_factor",                    default: 12
    t.boolean  "division",                                     default: false
    t.integer  "division_percent"
    t.integer  "division_mastery"
    t.integer  "division_max_factor",                          default: 12
    t.boolean  "word_problems",                                default: false
    t.integer  "word_problems_percent"
    t.integer  "word_problmes_mastery"
    t.integer  "word_problems_digits"
    t.boolean  "word_problems_grouping",                       default: false
    t.boolean  "word_problems_addition",                       default: false
    t.integer  "word_problems_addition_percent"
    t.integer  "word_problems_addition_mastery"
    t.integer  "word_problems_addition_digits"
    t.boolean  "word_problems_addition_grouping",              default: false
    t.boolean  "word_problems_subtraction",                    default: false
    t.integer  "word_problems_subtraction_percent"
    t.integer  "word_problems_subtraction_mastery"
    t.integer  "word_problems_subtraction_digits"
    t.boolean  "word_problems_subtraction_grouping",           default: false
    t.boolean  "word_problems_multiplication",                 default: false
    t.integer  "word_problems_multiplication_percent"
    t.integer  "word_problems_multiplication_mastery"
    t.integer  "word_problems_multiplication_digits"
    t.integer  "word_problems_multiplication_max_factor",      default: 12
    t.boolean  "word_problems_division",                       default: false
    t.integer  "word_problems_division_percent"
    t.integer  "word_problems_division_mastery"
    t.integer  "word_problems_division_max_factor"
    t.boolean  "multi_step",                                   default: false
    t.integer  "multi_step_percent"
    t.integer  "multi_step_mastery"
    t.boolean  "multi_step_order_of_operations",               default: true
    t.boolean  "multi_step_word_problems",                     default: false
    t.integer  "multi_step_word_problems_percent"
    t.integer  "multi_step_word_problems_mastery"
    t.boolean  "multi_step_word_problems_order_of_operations", default: true
    t.boolean  "money_identifying_coins",                      default: false
    t.integer  "money_identifying_coins_percent"
    t.integer  "money_identifying_coins_mastery"
    t.boolean  "money_identifying_bills",                      default: false
    t.integer  "money_identifying_bills_percent"
    t.integer  "money_identifying_bills_mastery"
    t.boolean  "money_addition",                               default: false
    t.integer  "money_addition_percent"
    t.integer  "money_addition_mastery"
    t.boolean  "money_change",                                 default: false
    t.integer  "money_change_percent"
    t.integer  "money_change_mastery"
    t.boolean  "money_enough",                                 default: false
    t.integer  "money_enough_percent"
    t.integer  "money_enough_mastery"
    t.boolean  "telling_time",                                 default: false
    t.integer  "telling_time_percent"
    t.integer  "telling_time_mastery"
    t.integer  "telling_time_unit_size"
    t.boolean  "time_elapsed",                                 default: false
    t.integer  "time_elapsed_percent"
    t.integer  "time_elapsed_mastery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
