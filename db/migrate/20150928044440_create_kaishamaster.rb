class CreateKaishamaster < ActiveRecord::Migration
  def up
    create_table :会社マスタ do |t|
      t.string :会社コード
      t.string :会社名
      t.text :備考
      t.timestamps null: false
    end
  end
  def down
    drop_table :会社マスタ
  end
end
