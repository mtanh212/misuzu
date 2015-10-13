class AddBelongToJobmst < ActiveRecord::Migration
  def change
    add_reference :JOBマスタ, :kaishamaster
  end
end
