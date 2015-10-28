class Sagyou < ActiveRecord::Migration
  def up
      create_table :作業場所マスタ do |t|
      t.string :作業場所コード
      t.string :作業場所名
      t.timestamps
    end
  end
  
  def down
    drop_table :作業場所マスタ
  end
end
