class CreateShainmaster < ActiveRecord::Migration
  def up
    create_table :社員マスタ do |t|
      t.string :社員番号
      t.string :連携用社員番号
      t.string :氏名
      t.string :所属コード
      t.string :直間区分
      t.string :役職コード
      t.timestamps null: false
    end
  end
  def down
    drop_table :社員マスタ
  end
end
