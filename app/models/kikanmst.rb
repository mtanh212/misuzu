class Kikanmst < ActiveRecord::Base
  self.table_name = :機関マスタ
  self.primary_key = :機関コード

  alias_attribute :id, :機関コード 
  alias_attribute :name, :機関名 
  alias_attribute :note, :備考

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Kikanmst.create! row.to_hash
    end
  end

end