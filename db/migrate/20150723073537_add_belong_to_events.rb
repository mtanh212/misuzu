class AddBelongToEvents < ActiveRecord::Migration
  def change
    add_belongs_to :events, :shainmaster
  end
end
