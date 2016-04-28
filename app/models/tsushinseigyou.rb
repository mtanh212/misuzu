class Tsushinseigyou < ActiveRecord::Base
  self.table_name = :通信制御マスタ
  belongs_to :shainmaster, foreign_key: :社員番号
  delegate :氏名, to: :shainmaster, prefix: :shain, allow_nil: true
end
