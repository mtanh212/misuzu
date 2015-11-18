class Eki < ActiveRecord::Base
  self.table_name = :駅マスタ
  self.primary_key = :駅コード
  
  alias_attribute :id, :駅コード
  alias_attribute :name, :駅名
end