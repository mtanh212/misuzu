class Yakushokumaster < ActiveRecord::Base
  self.table_name = :役職マスタ
  self.primary_key = :役職コード

  validates :役職コード, :役職名, presence: true
  validates :役職コード, uniqueness: true

  has_many :shainmasters, foreign_key: :役職コード

  alias_attribute :id, :役職コード
  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Yakushokumaster.create! row.to_hash
    end
  end
end
