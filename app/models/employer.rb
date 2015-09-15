class Employer < ActiveRecord::Base
  self.table_name = 'employer'
  # validates :email, confirmation: true
  validates :first_name, :age, presence: true
end