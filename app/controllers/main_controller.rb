class MainController < ApplicationController
  def index
     @kairanCount = Kairanshosai.where(対象者: session[:user], 確認: false).count
  end
end
