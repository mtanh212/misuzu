class Kairan < ActiveRecord::Base
  self.table_name = :回覧

  belongs_to :kairanyokenmst, foreign_key: :要件

  has_many :kairanshosais, dependent: :destroy

  # delegate :要件名, to: :kairanyokenmst, prefix: :job, allow_nil: true
  delegate :名称, to: :kairanyokenmst, allow_nil: true

end
