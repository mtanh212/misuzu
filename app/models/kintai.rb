class Kintai < ActiveRecord::Base
  scope :current_month, ->(member) { where("社員番号 = ? and date(日付) between ? and ?", member, Date.today.beginning_of_month, Date.today.end_of_month) }
  scope :selected_month, ->(member,month) { where("社員番号 = ? and date(日付) between ? and ?", member, month.beginning_of_month, month.end_of_month) }

  belongs_to :joutaimaster, foreign_key: :状態1

end