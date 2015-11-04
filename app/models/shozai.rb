class Shozai < ActiveRecord::Base
  self.table_name = "所在マスタ"
  
  validates :所在コード, :所在名, presence: true
  
  has_many :events
  has_one :shainmaster
  
  alias_attribute :code, :所在コード
  alias_attribute :name, :所在名
  alias_attribute :background_color, :背景色
  alias_attribute :text_color, :文字色
end
