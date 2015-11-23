class KintaisController < ApplicationController
  before_action :set_kintai, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kintais = Kintai.order(:日付).all
    respond_with(@kintais)
  end

  def show
    respond_with(@kintai)
  end

  def new
    @kintai = Kintai.new
    respond_with(@kintai)
  end

  def edit
  end

  def create
    @kintai = Kintai.new(kintai_params)
    flash[:notice] = t 'app.flash.new_success' if @kintai.save
    respond_with(@kintai, location: kintais_url )
  end

  def update
    flash[:notice] = t 'app.flash.update_success' if @kintai.update(kintai_params)
    respond_with(@kintai, location: kintais_url)
  end

  def destroy
    flash[:notice] = t 'app.flash.delete_success' if @kintai.destroy
    respond_with(@kintai, location: kintais_url)
  end

  private
    def set_kintai
      @kintai = Kintai.find(params[:id])
      @joutais = Joutaimaster.where(勤怠使用区分: '1')
    end

    def kintai_params
      params.require(:kintai).permit(:日付, :曜日, :勤務タイプ, :出勤時刻, :退社時刻, :保守携帯回数, :状態1, :状態2,
      :状態3, :備考, :実労働時間, :遅刻時間, :早退時間, :普通残業時間, :深夜残業時間, :普通保守時間, :深夜保守時間)
    end
end
