module KairansHelper
  def updateKairanDetail(kairan_id, shain)
    Kairanshosai.where(回覧コード: kairan_id).destroy_all
    arrShain = shain.split(',') if shain
    return if arrShain.nil?
    arrShain.each do |shainNo|
      Kairanshosai.create(回覧コード: kairan_id, 対象者: shainNo, 確認: false)
    end
  end
end
