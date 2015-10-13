class Shozai < ActiveRecord::Base
  self.table_name = "所在マスタ"
  
  validates :所在コード, :所在名, presence: true
  
  has_many :events
  
  alias_attribute :code, :所在コード
  alias_attribute :name, :所在名
end
