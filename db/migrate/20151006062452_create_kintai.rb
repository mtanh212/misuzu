class CreateKintai < ActiveRecord::Migration
  def change
    create_table :kintais do |t|
      t.date :日付
      t.string :曜日
      t.string :勤務タイプ
      t.datetime :出勤時刻
      t.datetime :退社時刻
      t.decimal :実労働時間
      t.decimal :遅刻時間
      t.decimal :早退時間
      t.decimal :普通残業時間
      t.decimal :深夜残業時間
      t.decimal :普通保守時間
      t.decimal :深夜保守時間
      t.decimal :保守携帯回数
      t.integer :状態1
      t.integer :状態2
      t.integer :状態3
      t.text :備考
      
      t.timestamps null: false
    end
  end
end
