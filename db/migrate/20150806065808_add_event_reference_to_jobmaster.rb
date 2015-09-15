class AddEventReferenceToJobmaster < ActiveRecord::Migration
  def change
    add_reference :events, :jobmaster
  end
end
