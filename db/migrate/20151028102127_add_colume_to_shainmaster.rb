class AddColumeToShainmaster < ActiveRecord::Migration
  def up
    add_column :社員マスタ, :内線電話番号, :string
    add_column :社員マスタ, :伝言件数, :string
    add_column :社員マスタ, :回覧件数, :string
    add_reference :社員マスタ, :shozai
  end
  def down
    remove_columns :社員マスタ, :内線電話番号, :伝言件数, :回覧件数
    remove_reference :社員マスタ, :shozai
  end
end
