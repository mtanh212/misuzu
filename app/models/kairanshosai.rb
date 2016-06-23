class Kairanshosai < ActiveRecord::Base
  self.table_name = :回覧詳細

  belongs_to :kairan, foreign_key: :回覧コード

  delegate :要件, to: :kairan, allow_nil: true
  delegate :開始, to: :kairan, allow_nil: true
  delegate :件名, to: :kairan, allow_nil: true
  delegate :内容, to: :kairan, allow_nil: true
  # delegate :確認, to: :kairan, allow_nil: true

end
