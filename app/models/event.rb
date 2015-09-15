class Event < ActiveRecord::Base
  self.table_name = 'events'
  
  validates :社員番号, :開始, presence: true
  validates :工程コード, :場所コード, :所在コード, :JOB, presence: true, if: Proc.new{|event| event.joutaimaster.try(:状態区分) == '1'}
  # validates :帰社区分, presence: true, if: :check_kubun
  validates :帰社区分, presence: true, if: Proc.new{|event| event.shozai.try(:所在名).in?(%w(外出 出張 出張移動))}
  
  belongs_to :shainmaster
  belongs_to :joutaimaster
  belongs_to :bashomaster
  belongs_to :kouteimaster
  belongs_to :shozai
  belongs_to :jobmaster
  
end