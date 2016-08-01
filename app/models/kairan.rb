class Kairan < ActiveRecord::Base
  self.table_name = :回覧

  belongs_to :kairanyokenmst, foreign_key: :要件
  belongs_to :shainmaster, foreign_key: :発行者

  # has_many :kairanshosais, dependent: :destroy
  has_many :kairanshosais, foreign_key: :回覧コード

  # delegate :要件名, to: :kairanyokenmst, prefix: :job, allow_nil: true
  delegate :名称, to: :kairanyokenmst, allow_nil: true
  delegate :氏名, to: :shainmaster, allow_nil: true

end
