class Kikan < ActiveRecord::Base
  self.table_name = '機関マスタ'
  
  alias_attribute :code, :機関コード 
  alias_attribute :name, :機関名 
  alias_attribute :note, :備考 
end