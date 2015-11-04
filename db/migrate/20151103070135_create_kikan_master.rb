class CreateKikanMaster < ActiveRecord::Migration
  def up
    create_table :機関マスタ do |t|
      t.string :機関コード
      t.string :機関名
      t.text :備考
      t.timestamps null: false 
    end
  end
  def down
    drop_table :機関マスタ
  end
end
