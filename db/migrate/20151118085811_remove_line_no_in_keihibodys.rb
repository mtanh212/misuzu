class RemoveLineNoInKeihibodys < ActiveRecord::Migration
  def change
    # remove_index :keihi_bodies, :index_keihi_bodies_on_申請番号_and_行番号
    # add_index :keihi_bodies, :申請番号, unique: true
  end
end
