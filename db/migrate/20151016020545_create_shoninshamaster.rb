class CreateShoninshamaster < ActiveRecord::Migration
  def up
    create_table :承認者マスタ do |t|
      t.string :申請者
      t.string :承認者
      t.timestamps null: false
    end
  end
  def down
    drop_table :承認者マスタ
  end
end
