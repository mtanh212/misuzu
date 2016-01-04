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

ActiveRecord::Schema.define(version: 20151226042301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "JOBマスタ", id: false, force: :cascade do |t|
    t.string   "job番号",      null: false
    t.string   "job名"
    t.date     "開始日"
    t.date     "終了日"
    t.integer  "ユーザ番号"
    t.string   "ユーザ名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "JOBマスタ", ["job番号"], name: "index_JOBマスタ_on_job番号", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "社員番号"
    t.datetime "開始"
    t.datetime "終了"
    t.string   "状態コード"
    t.string   "場所コード"
    t.string   "JOB"
    t.string   "所属コード"
    t.string   "工程コード"
    t.string   "工数"
    t.string   "計上"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jpt_holiday_msts", force: :cascade do |t|
    t.date     "event_date"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "keihi_bodies", force: :cascade do |t|
    t.string   "申請番号"
    t.date     "日付"
    t.string   "社員番号"
    t.string   "相手先"
    t.string   "機関名"
    t.string   "発"
    t.string   "着"
    t.string   "発着kubun"
    t.string   "交通費"
    t.string   "日当"
    t.string   "宿泊費"
    t.string   "その他"
    t.string   "JOB"
    t.text     "備考"
    t.string   "領収書kubun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keihi_heads", id: false, force: :cascade do |t|
    t.string   "申請番号",       null: false
    t.date     "日付"
    t.string   "社員番号"
    t.string   "申請者"
    t.string   "交通費合計"
    t.string   "日当合計"
    t.string   "宿泊費合計"
    t.string   "その他合計"
    t.string   "旅費合計"
    t.string   "仮払金"
    t.string   "合計"
    t.string   "支給品"
    t.string   "過不足"
    t.string   "承認kubun"
    t.string   "承認者"
    t.date     "清算予定日"
    t.date     "清算日"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keihi_heads", ["申請番号"], name: "index_keihi_heads_on_申請番号", unique: true, using: :btree

  create_table "kintais", force: :cascade do |t|
    t.date     "日付"
    t.string   "曜日"
    t.string   "勤務タイプ"
    t.time     "出勤時刻"
    t.time     "退社時刻"
    t.decimal  "実労働時間"
    t.decimal  "遅刻時間"
    t.decimal  "早退時間"
    t.decimal  "普通残業時間"
    t.decimal  "深夜残業時間"
    t.decimal  "普通保守時間"
    t.decimal  "深夜保守時間"
    t.integer  "保守携帯回数"
    t.string   "状態1"
    t.string   "状態2"
    t.string   "状態3"
    t.text     "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "社員番号"
    t.string   "入力済"
    t.string   "holiday"
    t.date     "代休相手日付"
    t.string   "代休取得区分"
  end

  create_table "temps", force: :cascade do |t|
    t.date    "date"
    t.boolean "checked"
  end

  create_table "会社マスタ", id: false, force: :cascade do |t|
    t.string   "会社コード",      null: false
    t.string   "会社名"
    t.text     "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "会社マスタ", ["会社コード"], name: "index_会社マスタ_on_会社コード", unique: true, using: :btree

  create_table "場所マスタ", id: false, force: :cascade do |t|
    t.string   "場所コード",      null: false
    t.string   "場所名"
    t.string   "場所名カナ"
    t.string   "SUB"
    t.string   "場所区分"
    t.string   "会社コード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "場所マスタ", ["場所コード"], name: "index_場所マスタ_on_場所コード", unique: true, using: :btree

  create_table "工程マスタ", id: false, force: :cascade do |t|
    t.string   "所属コード",      null: false
    t.string   "工程コード",      null: false
    t.string   "工程名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "工程マスタ", ["所属コード", "工程コード"], name: "index_工程マスタ_on_所属コード_and_工程コード", unique: true, using: :btree

  create_table "役職マスタ", id: false, force: :cascade do |t|
    t.string   "役職コード",      null: false
    t.string   "役職名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "役職マスタ", ["役職コード"], name: "index_役職マスタ_on_役職コード", unique: true, using: :btree

  create_table "所在マスタ", id: false, force: :cascade do |t|
    t.string   "所在コード",      null: false
    t.string   "所在名"
    t.string   "背景色"
    t.string   "文字色"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "所在マスタ", ["所在コード"], name: "index_所在マスタ_on_所在コード", unique: true, using: :btree

  create_table "所属マスタ", id: false, force: :cascade do |t|
    t.string   "所属コード",      null: false
    t.string   "所属名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "所属マスタ", ["所属コード"], name: "index_所属マスタ_on_所属コード", unique: true, using: :btree

  create_table "承認者マスタ", force: :cascade do |t|
    t.string   "申請者"
    t.string   "承認者"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "順番"
  end

  create_table "担当者マスタ", id: false, force: :cascade do |t|
    t.string   "担当者コード",              null: false
    t.string   "担当者名称"
    t.string   "パスワード"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "担当者マスタ", ["担当者コード"], name: "index_担当者マスタ_on_担当者コード", unique: true, using: :btree

  create_table "機関マスタ", id: false, force: :cascade do |t|
    t.string   "機関コード",      null: false
    t.string   "機関名"
    t.text     "備考"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "機関マスタ", ["機関コード"], name: "index_機関マスタ_on_機関コード", unique: true, using: :btree

  create_table "状態マスタ", id: false, force: :cascade do |t|
    t.string   "状態コード",      null: false
    t.string   "状態名"
    t.string   "状態区分"
    t.string   "勤怠状態名"
    t.string   "マーク"
    t.string   "色"
    t.string   "文字色"
    t.string   "WEB使用区分"
    t.string   "勤怠使用区分"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "状態マスタ", ["状態コード"], name: "index_状態マスタ_on_状態コード", unique: true, using: :btree

  create_table "社員マスタ", id: false, force: :cascade do |t|
    t.string   "社員番号",       null: false
    t.string   "連携用社員番号"
    t.string   "氏名"
    t.string   "所属コード"
    t.string   "直間区分"
    t.string   "役職コード"
    t.string   "内線電話番号"
    t.string   "伝言件数"
    t.string   "回覧件数"
    t.string   "所在コード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "有給残数"
  end

  add_index "社員マスタ", ["社員番号"], name: "index_社員マスタ_on_社員番号", unique: true, using: :btree

  create_table "駅マスタ", id: false, force: :cascade do |t|
    t.string   "駅コード",       null: false
    t.string   "駅名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "駅マスタ", ["駅コード"], name: "index_駅マスタ_on_駅コード", unique: true, using: :btree

end
