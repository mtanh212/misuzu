class AddBelongToUser < ActiveRecord::Migration
  def change
    add_reference :担当者マスタ, :shainmaster
  end
end
