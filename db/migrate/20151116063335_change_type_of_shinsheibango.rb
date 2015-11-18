class ChangeTypeOfShinsheibango < ActiveRecord::Migration
  # def up
  #   change_column :keihi_heads, :申請番号, 'integer USING CAST(申請番号 AS integer)'
  #   change_column :keihi_bodies, :申請番号, 'integer USING CAST(申請番号 AS integer)'
  #   change_column :keihi_bodies, :行番号, 'integer USING CAST(行番号 AS integer)'
  # end
  # 
  # def down
  #   change_column :keihi_heads, :申請番号, :string
  #   change_column :keihi_bodies, :申請番号, :string
  #   change_column :keihi_bodies, :行番号, :string
  # 
  # end
end
