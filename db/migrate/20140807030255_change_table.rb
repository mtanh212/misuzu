class ChangeTable < ActiveRecord::Migration
  def up
    create_table :担当者マスタ do |t|
      t.string :担当者コード
      t.string :担当者名称
      t.string :パスワード

      t.timestamps
    end
  end
  
  def down
    drop_table :担当者マスタ
  end
end
