class Keihibody < ActiveRecord::Base
  self.table_name = 'keihi_bodies'
  belongs_to :keihihead
  
  alias_attribute :shinsheino, :申請番号
  alias_attribute :line_no, :行番号
end