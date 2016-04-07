class Kintai < ActiveRecord::Base
  # scope :current_month, ->(member) { where( 社員番号: member, 日付: Date.today.beginning_of_month..Date.today.end_of_month )}
  scope :selected_month, ->(member,month) { where( 社員番号:  member, 日付: month.beginning_of_month..month.end_of_month ) }
  scope :current_user, ->(member) { where( 社員番号: member)}

  belongs_to :joutaimaster, foreign_key: :状態1

  KINMU_TYPE = %w(001 002 003 004 005 006 007 008 009)

  validate :check_date_input

  def check_date_input
    if 出勤時刻.present? && 退社時刻.present?
      if 出勤時刻 > 退社時刻
        errors.add(:退社時刻, "は出勤時刻以上の値にしてください。")
      end
      if ((退社時刻 - 出勤時刻)/1.hour).to_i > 22
        errors.add(:退社時刻, "は22時間より小さい値にしてください。")
      end
    end
  end
end