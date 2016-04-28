class Dengonyouken < ActiveRecord::Base
  self.table_name = :伝言用件マスタ

  validates :種類名, presence: true

end
