class Joutaimaster < ActiveRecord::Base
  self.table_name = :状態マスタ
  self.primary_key = :状態コード

  validates :状態コード, :状態名, presence: true
  has_one :event, foreign_key: :状態コード
  
  alias_attribute :id, :状態コード
  alias_attribute :name, :状態名
  alias_attribute :color, :色
  alias_attribute :text_color, :文字色
  
  def events
    super || build_events
  end

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Joutaimaster.create! row.to_hash
    end
  end

end
