class Bashomaster < ActiveRecord::Base
  self.table_name = '場所マスタ'
  validates :場所コード, :場所名, presence: true
  has_many :events
end
