class Employer < ActiveRecord::Migration
  def up
    create_table :employer do |t|
      t.string :first_name
      t.string :position
      t.string :office
      t.integer :age
      t.date :start_date
      t.decimal :salary
      t.timestamps
    end
  end
  def down
    drop_table :employer
  end
end
