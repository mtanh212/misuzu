class Dengonkaitou < ActiveRecord::Base
  self.table_name = :伝言回答マスタ

  validates :種類名, presence: true

end
