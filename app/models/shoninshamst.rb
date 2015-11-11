class Shoninshamst < ActiveRecord::Base
  self.table_name = '承認者マスタ'
  
  alias_attribute :code, :申請者
  alias_attribute :name, :申請者
end