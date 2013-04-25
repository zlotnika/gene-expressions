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

ActiveRecord::Schema.define(:version => 20130424051155) do

  create_table "chips", :force => true do |t|
    t.string   "chip_id"
    t.integer  "gene_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "chips", ["gene_id"], :name => "index_chips_on_gene_id"

  create_table "genes", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tissues", :force => true do |t|
    t.string   "name"
    t.integer  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "values", :force => true do |t|
    t.float    "mean"
    t.float    "standard_deviation"
    t.integer  "chip_id"
    t.integer  "tissue_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "values", ["chip_id"], :name => "index_values_on_chip_id"
  add_index "values", ["tissue_id"], :name => "index_values_on_tissue_id"

end
