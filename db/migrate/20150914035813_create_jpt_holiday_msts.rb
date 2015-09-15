class CreateJptHolidayMsts < ActiveRecord::Migration
  def change
    create_table :jpt_holiday_msts do |t|
      t.date :event_date
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
