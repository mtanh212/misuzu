class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :担当者マスタ, :admin, :boolean, default: false
  end
end
