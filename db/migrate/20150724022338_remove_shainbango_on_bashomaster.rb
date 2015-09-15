class RemoveShainbangoOnBashomaster < ActiveRecord::Migration
  def change
    remove_column :場所マスタ, :社員番号
  end
end
