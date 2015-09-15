class Shozai < ActiveRecord::Base
  self.table_name = "所在マスタ"
  
  validates :所在コード, :所在名, presence: true
  
  has_many :events
end
