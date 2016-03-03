class Bashokubunmst < ActiveRecord::Base
  self.table_name = :場所区分マスタ
  self.primary_key = :場所区分コード

  validates :場所区分コード, :場所区分名, presence: true
  validates :場所区分コード, uniqueness: true

  has_one :bashomaster, foreign_key: :場所区分コード

  alias_attribute :code, :場所コード
  alias_attribute :name, :場所名
end
