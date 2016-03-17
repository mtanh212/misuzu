class User < ActiveRecord::Base
  self.table_name = :担当者マスタ
  self.primary_key = :担当者コード


  # validates :email, confirmation: true
  validates :担当者コード, :担当者名称, :パスワード, presence: true
  validates :担当者コード, uniqueness: true
  validate :check_taken, on: :create

  # validates :email_confirmation, presence: true
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :shainmaster, foreign_key: :担当者コード
  
  alias_attribute :id, :担当者コード
  alias_attribute :name, :担当者名称

  def check_taken
    if 担当者コード.present? && 担当者コード.in?(User.pluck(:担当者コード))
      errors.add(:担当者コード, 'はすでに存在します。')
    end

    if !担当者コード.in?(Shainmaster.pluck(:連携用社員番号))
      errors.add(:担当者コード, 'は不正な値です。')
    end
  end
end