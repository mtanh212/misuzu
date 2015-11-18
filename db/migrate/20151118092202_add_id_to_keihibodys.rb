class AddIdToKeihibodys < ActiveRecord::Migration
  def up
    # create_table :keihi_bodies do |t|
    #   t.string   :申請番号
    #   t.date     :日付
    #   t.string   :社員番号
    #   t.string   :相手先
    #   t.string   :機関名
    #   t.string   :発
    #   t.string   :着
    #   t.string   :発着kubun
    #   t.string   :交通費
    #   t.string   :日当
    #   t.string   :宿泊費
    #   t.string   :その他
    #   t.string   :JOB
    #   t.text     :備考
    #   t.string   :領収書kubun
    #   t.timestamps null:false
    # end
  end
  def down
    drop_table :keihi_bodies
  end
end
