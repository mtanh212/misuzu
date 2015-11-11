Shainmaster.all.each do |shain|
  shain.shozokumaster = Shozokumaster.find_by(所属コード: shain.所属コード)
  shain.yakushokumaster = Yakushokumaster.find_by(役職コード: shain.役職コード)
  shain.save
end

Kouteimaster.all.each do |koutei|
  koutei.shozokumaster = Shozokumaster.find_by(所属コード: koutei.所属コード)
  koutei.save
end

User.all.each do |_user|
  _user.shainmaster = Shainmaster.find_by(連携用社員番号: _user.担当者コード)
  _user.save
end