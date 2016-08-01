class Yakushokumaster < ActiveRecord::Base
  self.table_name = :役職マスタ
  self.primary_key = :役職コード

  validates :役職コード, :役職名, presence: true
  validates :役職コード, uniqueness: true

  has_many :shainmasters, foreign_key: :役職コード

  alias_attribute :id, :役職コード
end
