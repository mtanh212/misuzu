class Event < ActiveRecord::Base
  self.table_name = 'events'
  
  validates :社員番号, :開始, :状態コード, presence: true
  validates :工程コード, :場所コード, :JOB, presence: true, if: Proc.new{|event| event.joutaimaster.try(:状態区分) == '1'}
  validates :帰社区分, presence: true, if: Proc.new{|event| event.shozai.try(:所在名).in?(%w(外出 出張 出張移動))}
  
  belongs_to :shainmaster
  belongs_to :joutaimaster
  belongs_to :bashomaster
  belongs_to :kouteimaster
  belongs_to :shozai
  belongs_to :jobmaster
  
  alias_attribute :shain_no, :社員番号
  alias_attribute :start_time, :開始
  alias_attribute :end_time, :終了
  alias_attribute :joutai_code, :状態コード
  alias_attribute :basho_code, :場所コード
  alias_attribute :kisha, :帰社区分
  alias_attribute :koutei_code, :工程コード
  alias_attribute :shozoku_code, :所属コード
  alias_attribute :kousuu, :工数
  alias_attribute :shozai_code, :所在コード
  

  # accepts_nested_attributes_for :joutaimaster, update_only: true
end