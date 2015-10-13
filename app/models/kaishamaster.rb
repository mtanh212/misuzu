class Kaishamaster < ActiveRecord::Base
self.table_name = '会社マスタ'
  validates :code, :name, presence: true
  has_one :bashomaster
  has_one :jobmaster

  alias_attribute :code, :会社コード
  alias_attribute :name, :会社名
  alias_attribute :note, :備考
end
