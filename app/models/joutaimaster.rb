class Joutaimaster < ActiveRecord::Base
  self.table_name = '状態マスタ'
  validates :状態コード, :状態名, presence: true
  has_one :event
  
  alias_attribute :code, :状態コード
  alias_attribute :name, :状態名
  alias_attribute :color, :色
  alias_attribute :text_color, :文字色
  
  def events
    super || build_events
  end
end
