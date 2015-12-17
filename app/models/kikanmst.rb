class Kikanmst < ActiveRecord::Base
  self.table_name = :機関マスタ
  self.primary_key = :機関コード

  alias_attribute :id, :機関コード 
  alias_attribute :name, :機関名 
  alias_attribute :note, :備考

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Kikanmst.create! row.to_hash
    end
  end

end