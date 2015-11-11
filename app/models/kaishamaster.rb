class Kaishamaster < ActiveRecord::Base
self.table_name = '会社マスタ'
  validates :code, :name, presence: true
  has_one :bashomaster
  has_one :jobmaster

  alias_attribute :code, :会社コード
  alias_attribute :name, :会社名
  alias_attribute :note, :備考

# a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Kaishamaster.create! row.to_hash
    end
  end

end
