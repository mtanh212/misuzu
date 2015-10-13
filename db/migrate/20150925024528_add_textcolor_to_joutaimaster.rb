class AddTextcolorToJoutaimaster < ActiveRecord::Migration
  def change
    add_column :状態マスタ, :文字色, :string, default: '#EFEFEF'
  end
end
