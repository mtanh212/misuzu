class Kintai < ActiveRecord::Base
  scope :current_month, ->(member) { where( 社員番号: member, 日付: Date.today.beginning_of_month..Date.today.end_of_month )}
  scope :current_user, ->(member) { where( 社員番号: member)}
  scope :selected_month, ->(member,month) { where( 社員番号:  member, 日付: month.beginning_of_month..month.end_of_month ) }

  belongs_to :joutaimaster, foreign_key: :状態1

  KINMU_TYPE = %w(1 2 3 4 5 6 7 8 9)

end