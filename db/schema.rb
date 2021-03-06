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

ActiveRecord::Schema.define(version: 20160604090605) do
  create_table 'months', force: :cascade do |t|
    t.string   'name_month', null: false
    t.datetime '"created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'months_years', id: false, force: :cascade do |t|
    t.integer 'month_id'
    t.integer 'year_id'
  end

  add_index 'months_years', ['month_id'], name: 'index_months_years_on_month_id'
  add_index 'months_years', ['year_id'], name: 'index_months_years_on_year_id'

  create_table 'payments', force: :cascade do |t|
    t.decimal  'payment',       precision: 8, scale: 2
    t.decimal  'other_payment', precision: 8, scale: 2, default: 0.0
    t.text     'description'
    t.integer  'month_id',                                        null: false
    t.datetime 'created_at',                                      null: false
    t.datetime 'updated_at',                                      null: false
    t.integer  'year'
    t.decimal  'debit'
  end

  add_index 'payments', ['month_id'], name: 'index_payments_on_month_id'

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.string   'email'
    t.datetime 'created_at',                      null: false
    t.datetime 'updated_at',                      null: false
    t.string   'password_digest'
    t.string   'remember_token'
    t.boolean  'admin',           default: false
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['remember_token'], name: 'index_users_on_remember_token'

  create_table 'years', force: :cascade do |t|
    t.string   'value_year', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
