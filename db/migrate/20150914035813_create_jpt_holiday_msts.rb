class CreateJptHolidayMsts < ActiveRecord::Migration
  def up
    create_table :jpt_holiday_msts do |t|
      t.date :event_date
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
  def down
    drop_table :jpt_holiday_msts
  end
end
