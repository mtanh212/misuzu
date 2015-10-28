class Kouteimaster < ActiveRecord::Migration
  def up
    create_table :工程マスタ do |t|
      t.string :所属コード
      t.string :工程コード
      t.string :工程名
      t.timestamps null: false
    end
  end
  def down
    drop_table :工程マスタ
  end
end
