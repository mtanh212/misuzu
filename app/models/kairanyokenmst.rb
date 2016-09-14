class Kairanyokenmst < ActiveRecord::Base
  self.table_name = :回覧用件マスタ

  validates :名称, presence: true
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Kairanyokenmst.create! row.to_hash
    end
  end
end
