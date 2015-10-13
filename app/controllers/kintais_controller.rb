class KintaisController < ApplicationController
  before_action :set_kintai, only: [:index]
  respond_to :js
  
  def index
    respond_with @kintais
  end
  
  private
  def set_kintai
    @kintais = Kintai.all
  end
end