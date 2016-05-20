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

ActiveRecord::Schema.define(version: 20160517115322) do

  create_table "adherents", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "CIN"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "editeurs", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "livres", force: :cascade do |t|
    t.integer  "isbn"
    t.string   "titre"
    t.string   "auteur"
    t.integer  "estDispo"
    t.integer  "estValide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "editeur"
  end

  create_table "livres_empruntes", force: :cascade do |t|
    t.integer  "livre_id"
    t.integer  "adherent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "estAdmin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
