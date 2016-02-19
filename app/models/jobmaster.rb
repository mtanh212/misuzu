class Jobmaster < ActiveRecord::Base
  self.table_name = :JOBマスタ
  self.primary_key = :job番号
  
  validates :job番号, :job名, presence: true
  validates :job番号, uniqueness: true

  has_one :events, foreign_key: :JOB
  belongs_to :kaishamaster, class_name: :Kaishamaster, foreign_key: :ユーザ番号
  
  alias_attribute :id, :job番号
  alias_attribute :job_name, :job名

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Jobmaster.create! row.to_hash
    end
  end
  
  # def to_param
  #   id.parameterize
  # end

end
