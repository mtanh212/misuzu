class CreateShozoku < ActiveRecord::Migration
  def up
    create_table :所属マスタ do |t|
      t.string :所属コード
      t.string :所属名
      t.timestamps null: false
    end
  end
  def down
    drop_table :所属マスタ
  end
end
