class CreateYakushoku < ActiveRecord::Migration
  def up
    create_table :役職テーブル do |t|
      t.string :役職コード
      t.string :役職名
      t.timestamps null: false
    end
  end
  def down
    drop_table :役職テーブル
  end
end
