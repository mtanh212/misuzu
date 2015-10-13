class Bashomaster < ActiveRecord::Base
  self.table_name = '場所マスタ'
  validates :場所コード, :場所名, presence: true
  validates :会社コード, presence: true, if: :basho_kubun?
  has_many :events
  
  belongs_to :kaishamaster

  delegate :name, to: :kaishamaster, prefix: :kaisha, allow_nil: true
  
  alias_attribute :code, :場所コード
  alias_attribute :name, :場所名

  def basho_kubun?
    場所区分 == '2'
  end

end
