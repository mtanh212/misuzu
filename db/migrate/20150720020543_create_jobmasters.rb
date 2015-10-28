class CreateJobmasters < ActiveRecord::Migration
  def up
    create_table :JOBマスタ do |t|
      t.string :job番号
      t.string :job名
      t.date :開始日
      t.date :終了日
      t.string :ユーザ番号
      t.string :ユーザ名

      t.timestamps null: false
    end
  end
  def down
    drop_table :JOBマスタ
  end
end
