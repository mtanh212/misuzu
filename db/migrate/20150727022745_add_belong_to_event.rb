class AddBelongToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :joutaimaster
    add_reference :events, :bashomaster
    add_reference :events, :kouteimaster
  end
end
