class CreateKeihiHeads < ActiveRecord::Migration
  def up
    create_table :keihi_heads do |t|
      t.string :申請番号
      t.datetime :日付
      t.string :社員番号
      t.string :申請者
      t.string :交通費合計
      t.string :日当合計
      t.string :宿泊費合計
      t.string :その他合計
      t.string :旅費合計
      t.string :仮払金
      t.string :合計
      t.string :支給品
      t.string :過不足
      t.string :承認kubun
      t.string :承認者
      t.datetime :清算予定日
      t.datetime :清算日
      t.timestamps null: false
    end
  end
  def down
    drop_table :keihi_heads
  end
end
