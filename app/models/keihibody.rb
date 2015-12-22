class Keihibody < ActiveRecord::Base
  self.table_name = :keihi_bodies
  # self.primary_keys = [:申請番号,:行番号]
  # self.primary_key = :申請番号

  belongs_to :keihihead, foreign_key: :申請番号
  scope :current_member, ->(member) { where( 社員番号: member )}

end