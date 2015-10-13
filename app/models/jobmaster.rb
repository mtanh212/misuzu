class Jobmaster < ActiveRecord::Base
  self.table_name = 'JOBマスタ'
  
  validates :job番号, :job名, presence: true
  
  has_many :events
  belongs_to :kaishamaster
end
