class Setsubiyoyaku < ActiveRecord::Base
  self.table_name = :設備予約

  validates :設備コード, :開始, :終了, presence: true
    
  belongs_to :setsubi, foreign_key: :設備コード
  belongs_to :shainmaster, foreign_key: :予約者
  belongs_to :kaishamaster, foreign_key: :相手先

  validate :check_date_input
 
  def check_date_input
    if 開始.present? && 終了.present? && 開始 >= 終了
      errors.add(:終了, "は開始日以上の値にしてください。")
    end
    @setsubiyoyaku = Setsubiyoyaku.where 設備コード: 設備コード
    @setsubiyoyaku.each do |setsubiyoyaku|
      unless 開始 >= setsubiyoyaku.終了 || 終了<= setsubiyoyaku.開始
        errors.add(:設備コード, "は注文されました。")
      end
    end
  end 
end
