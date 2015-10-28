class Keihihead < ActiveRecord::Base
  self.table_name = 'keihi_heads'
  has_many :keihibodys
  accepts_nested_attributes_for :keihibodys,
                                allow_destroy: true,
                                reject_if: :all_blank
  alias_attribute :shinsheino, :申請番号
end
