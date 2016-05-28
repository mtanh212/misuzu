class Kouteimaster < ActiveRecord::Base
  self.table_name = :工程マスタ
  self.primary_keys = :所属コード, :工程コード

  validates :所属コード, :工程コード, :工程名, presence: true
  validates :工程コード, uniqueness: {scope: :所属コード}

  belongs_to :shozokumaster, foreign_key: :所属コード
  has_one :event, foreign_key: [:所属コード, :工程コード]
  
  alias_attribute :shozokucode, :所属コード
  alias_attribute :code, :工程コード
  alias_attribute :name, :工程名

  delegate :id, to: :shozokumaster, prefix: true, allow_nil: true
  delegate :name, to: :shozokumaster, prefix: true, allow_nil: true
end
