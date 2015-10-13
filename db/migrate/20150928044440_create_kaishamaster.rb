class CreateKaishamaster < ActiveRecord::Migration
  def change
    create_table :会社マスタ do |t|
      t.string :会社コード
      t.string :会社名
      t.text :備考
      t.timestamps null: false
    end
  end
end
