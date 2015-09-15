class AddKubunToEvent < ActiveRecord::Migration
  def change
    add_column :events, :帰社区分, :string
  end
end
