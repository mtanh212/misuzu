class Shozokumaster < ActiveRecord::Base
  self.table_name = '所属マスタ'
  
  validates :所属コード, :所属名, presence: true
  
  has_many :kouteimasters
  has_many :shainmasters
  
  alias_attribute :code, :所属コード
  alias_attribute :name, :所属名
end