class User < ActiveRecord::Base
  self.table_name = '担当者マスタ'
  # validates :email, confirmation: true
  validates :担当者コード, presence: true
  # validates :email_confirmation, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end