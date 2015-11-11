class Jobmaster < ActiveRecord::Base
  self.table_name = 'JOBマスタ'
  
  validates :job番号, :job名, presence: true
  
  has_many :events
  belongs_to :kaishamaster
  
  alias_attribute :job_name, :job名

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Jobmaster.create! row.to_hash
    end
  end

end
