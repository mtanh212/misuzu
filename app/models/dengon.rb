class Dengon < ActiveRecord::Base
  self.table_name = :伝言

  belongs_to :input_user, foreign_key: :入力者, class_name: 'Shainmaster'
  belongs_to :to_user, foreign_key: :to, class_name: 'Shainmaster'
  belongs_to :dengonyouken, foreign_key: :用件, class_name: 'Dengonyouken'
  belongs_to :dengonkaitou, foreign_key: :回答, class_name: 'Dengonkaitou'

  delegate :氏名, to: :input_user, prefix: :input_user, allow_nil: true
  delegate :氏名, to: :to_user, prefix: :to_user, allow_nil: true
  delegate :種類名, to: :dengonyouken, prefix: :youken, allow_nil: true
  delegate :種類名, to: :dengonkaitou, prefix: :kaitou, allow_nil: true
end
