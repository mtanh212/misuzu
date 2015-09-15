class Joutaimaster < ActiveRecord::Base
  self.table_name = '状態マスタ'
  validates :状態コード, :状態名, presence: true
  has_many :events
end
