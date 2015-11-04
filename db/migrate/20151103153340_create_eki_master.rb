class CreateEkiMaster < ActiveRecord::Migration
  def up
    create_table :駅マスタ do |t|
      t.string :駅コード
      t.string :駅名
      t.timestamps null: false
    end
  end
  def down
    drop_table :駅マスタ
  end
end
