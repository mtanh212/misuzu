class AddColorToShozai < ActiveRecord::Migration
  def change
    add_column :所在マスタ, :背景色, :string
    add_column :所在マスタ, :文字色, :string
  end
end
