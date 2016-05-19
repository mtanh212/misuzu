module DengonsHelper
  def update_dengon_counter()
    counter = Dengon.where(社員番号: session[:user], 確認: false).count
    Shainmaster.find(session[:user]).update(伝言件数: counter)
  end

  def send_mail(to_mail, subject_mail, body_mail)
    Mail.deliver do
      to to_mail
      from 'hminhduc@gmail.com'
      subject subject_mail
      body body_mail
    end
  end
end
