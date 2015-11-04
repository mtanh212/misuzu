class Eki < ActiveRecord::Base
  self.table_name = '駅マスタ'
  
  alias_attribute :code, :駅コード
  alias_attribute :name, :駅名
end