class Shainmaster < ActiveRecord::Base
  self.table_name = '社員マスタ'
  # default_scope { where("社員番号 is not '#{ENV['admin_user']}'")}
  
  validates :社員番号,:氏名, presence: true
  
  has_many :events, dependent: :destroy
  has_one :user, dependent: :destroy
  belongs_to :shozokumaster
  belongs_to :yakushokumaster
  
  alias_attribute :title, :氏名
  alias_attribute :shain_no, :社員番号

  def events
    super || build_events
  end

  def user
    super || build_user
  end
end