class Keihihead < ActiveRecord::Base
  self.table_name = :keihi_heads
  self.primary_key = :申請番号
  
  has_many :keihibodys, foreign_key: :申請番号
  
  accepts_nested_attributes_for :keihibodys,
                                allow_destroy: true,
                                reject_if: :all_blank
  
  alias_attribute :id, :申請番号
  
  after_destroy {|record|
    Keihibody.destroy(record.keihibodys.pluck(:申請番号))
  }
end 
