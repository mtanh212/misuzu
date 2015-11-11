class Bashomaster < ActiveRecord::Base
  self.table_name = '場所マスタ'
  validates :場所コード, :場所名, presence: true
  validates :会社コード, presence: true, if: :basho_kubun?
  has_many :events
  
  belongs_to :kaishamaster

  delegate :name, to: :kaishamaster, prefix: :kaisha, allow_nil: true
  
  alias_attribute :code, :場所コード
  alias_attribute :name, :場所名

  def basho_kubun?
    場所区分 == '2'
  end

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Bashomaster.create! row.to_hash
    end

    # reset foreign key
    unless Kaishamaster.count == 0
      Bashomaster.all.each do |basho|
        basho.kaishamaster = Kaishamaster.find_by(会社コード: basho.会社コード)
        basho.save
      end
    end
    
  end

end
