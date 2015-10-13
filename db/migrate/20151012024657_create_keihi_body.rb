class CreateKeihiBody < ActiveRecord::Migration
  def change
    create_table :keihi_bodies do |t|
      t.integer :申請番号
      t.integer :行番号
      t.datetime :日付
      t.string :社員番号
      t.string :相手先
      t.string :機関名
      t.string :発
      t.string :着
      t.integer :発着kubun
      t.decimal :交通費
      t.decimal :日当
      t.decimal :宿泊費
      t.decimal :その他
      t.string :JOB
      t.text :備考
      t.integer :領収書kubun
      
      t.timestamps null: false
    end
    
    create_table :keihi_heads do |t|
      t.integer :申請番号
      t.datetime :日付
      t.string :社員番号
      t.string :承認者
      t.decimal :交通費合計
      t.decimal :日当合計
      t.decimal :宿泊費合計
      t.decimal :その他合計
      t.decimal :旅費合計
      t.decimal :仮払金
      t.decimal :合計
      t.decimal :支給品
      t.decimal :過不足
      t.integer :承認kubun
      t.string :承認者
      t.datetime :清算予定日
      t.datetime :清算日
      
      t.timestamps null: false 
    end
    
    create_table :承認者マスタ do |t|
      t.string :申請者
      t.string :承認者
      
      t.timestamps null: false
    end
  end
end
