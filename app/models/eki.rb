class Eki < ActiveRecord::Base
  self.table_name = :駅マスタ
  self.primary_key = :駅コード


  validates :駅コード, :駅名, presence: true
  validates :駅コード, uniqueness: true

  alias_attribute :id, :駅コード
  alias_attribute :name, :駅名

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Eki.create! row.to_hash
    end
  end

end