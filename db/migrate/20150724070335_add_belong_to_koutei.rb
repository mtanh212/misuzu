class AddBelongToKoutei < ActiveRecord::Migration
  def change
    add_belongs_to :工程マスタ, :shozokumaster
  end
end
