class AddBelongToBashomaster < ActiveRecord::Migration
  def change
    add_reference :場所マスタ, :kaishamaster
  end
end
