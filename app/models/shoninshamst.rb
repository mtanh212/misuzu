class Shoninshamst < ActiveRecord::Base
  self.table_name = :承認者マスタ

  scope :current_user, ->(member) {where( 承認者: member)}
  belongs_to :shainmaster, foreign_key: :承認者

  validates :申請者, :承認者, presence: true

  delegate :title, to: :shainmaster, prefix: :shonin, allow_nil: true


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Shoninshamst.create! row.to_hash
    end
  end

  def self.to_csv
    attributes = %w{id 申請者 承認者}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |shoninshamst|
        csv << attributes.map{ |attr| shoninshamst.send(attr) }
      end
    end
  end
end
