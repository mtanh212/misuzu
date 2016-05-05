module DengonsHelper
  def update_dengon_counter()
    counter = Dengon.where(社員番号: session[:user], 確認: false).count
    Shainmaster.find(session[:user]).update(伝言件数: counter)
  end
end
