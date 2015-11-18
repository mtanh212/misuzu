class Yakushokumaster < ActiveRecord::Base
  self.table_name = :役職マスタ
  self.primary_key = :役職コード

  validates :役職コード, :役職名, presence: true
  
  has_one :shainmaster, foreign_key: :役職コード
  
  alias_attribute :id, :役職コード
end