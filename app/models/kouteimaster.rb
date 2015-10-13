class Kouteimaster < ActiveRecord::Base
  self.table_name = '工程マスタ'
  
  validates :所属コード, :工程コード, :工程名, presence: true
  
  belongs_to :shozokumaster
  has_many :events
  
  alias_attribute :shozokucode, :所属コード
  alias_attribute :code, :工程コード
  alias_attribute :name, :工程名

  delegate :code, to: :shozokumaster, prefix: true, allow_nil: true
  delegate :name, to: :shozokumaster, prefix: true, allow_nil: true
end
