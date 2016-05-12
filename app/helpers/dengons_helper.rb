module DengonsHelper
  def update_dengon_counter()
    counter = Dengon.where(社員番号: session[:user], 確認: false).count
    Shainmaster.find(session[:user]).update(伝言件数: counter)
  end

  def send_dengon_mail()
    to_mail = ''
    subject_mail = ''
    Mail.deliver do
      to to_mail
      from 'hminhduc@gmail.com'
      subject subject_mail
      body "パスワードを変更成功できました。この際から、ID:【#{session[:user]}】 PASS:【#{new_pass}】でログインしてくさだい！"
    end
  end
end
