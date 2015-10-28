class CreateKintai < ActiveRecord::Migration
  def up
    create_table :kintais do |t|
      t.date :日付
      t.string :曜日
      t.string :勤務タイプ
      t.datetime :出勤時刻
      t.datetime :退社時刻
      t.string :実労働時間
      t.string :遅刻時間
      t.string :早退時間
      t.string :普通残業時間
      t.string :深夜残業時間
      t.string :普通保守時間
      t.string :深夜保守時間
      t.string :保守携帯回数
      t.string :状態1
      t.string :状態2
      t.string :状態3
      t.text :備考
      
      t.timestamps null: false
    end
  end
  def down
    drop_table :kintais
  end
end
