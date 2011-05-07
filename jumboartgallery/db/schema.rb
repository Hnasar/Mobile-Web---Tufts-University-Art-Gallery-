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

ActiveRecord::Schema.define(:version => 20110506222746) do

  create_table "artworks", :force => true do |t|
    t.string   "object"
    t.string   "creator"
    t.string   "title"
    t.text     "description"
    t.text     "location"
    t.string   "recfrom"
    t.date     "date"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "building_locations", :force => true do |t|
    t.string   "name"
    t.string   "php_url"
    t.decimal  "lat",        :precision => 10, :scale => 6
    t.decimal  "lng",        :precision => 10, :scale => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitions", :force => true do |t|
    t.string   "name"
    t.date     "open"
    t.date     "close"
    t.text     "description"
    t.string   "location"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.time     "opening"
    t.string   "filename"
    t.time     "opening_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_items", :force => true do |t|
    t.integer  "artwork_id"
    t.integer  "tour_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", :force => true do |t|
    t.text     "desc"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
