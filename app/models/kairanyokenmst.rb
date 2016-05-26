class Kairanyokenmst < ActiveRecord::Base
  self.table_name = :回覧用件マスタ

  validates :名称, presence: true

end
