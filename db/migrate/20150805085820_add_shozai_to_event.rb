class AddShozaiToEvent < ActiveRecord::Migration
  def change
    add_column :events, :所在コード, :string
    add_reference :events, :shozai
  end
end
