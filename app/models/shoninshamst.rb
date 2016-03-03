class Shoninshamst < ActiveRecord::Base
  self.table_name = :承認者マスタ

  scope :current_user, ->(member) { where( 承認者: member)}
  belongs_to :shainmaster, foreign_key: :承認者

  validates :申請者, :承認者, presence: true

  delegate :title, to: :shainmaster, prefix: :shonin, allow_nil: true
end