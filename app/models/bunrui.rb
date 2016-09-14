class Bunrui < ActiveRecord::Base
  self.table_name = :分類マスタ
  self.primary_key = :分類コード

  validates :分類コード, uniqueness: true
  validates :分類コード, :分類名, presence: true

  has_one :jobmaster, foreign_key: :分類コード
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Bunrui.create! row.to_hash
    end
  end
end