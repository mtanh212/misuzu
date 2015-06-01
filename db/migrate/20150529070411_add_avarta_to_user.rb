class AddAvartaToUser < ActiveRecord::Migration
  def up
    add_attachment :担当者マスタ, :avatar
  end

  def down
    remove_attachment :担当者マスタ, :avatar
  end
end
