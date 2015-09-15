class AddBelongToShain < ActiveRecord::Migration
  def change
    add_reference :社員マスタ, :shozokumaster
    add_reference :社員マスタ, :yakushokumaster
  end
end
