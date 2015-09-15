class Yakushokumaster < ActiveRecord::Base
  self.table_name = '役職テーブル'
  
  validates :役職コード, :役職名, presence: true
  
  has_many :shainmasters
end