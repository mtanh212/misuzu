class KintaisController < ApplicationController
  before_action :set_kintai, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @kintais = Kintai.selected_month(session[:user],Date.today).order(:日付)
    @kintai = Kintai.new 日付: Date.today
    finish_flag = Kintai.find_by(社員番号: session[:user], 日付: Date.today.beginning_of_month).try :入力済 || '0'
    if finish_flag == '1'
      render :show
    else
      render :index
    end
  end

  def matching_date
    session[:selected_date] = kintai_params[:日付]
    redirect_to matching_date_return_kintais_url
  end

  def matching_date_return
    date_param = session[:selected_date]
    date_param = Date.today if date_param.nil?
    date = date_param.to_date
    @kintais = Kintai.selected_month(session[:user],date).order(:日付)
    @kintai = Kintai.new 日付: date
    finish_flag = Kintai.find_by(社員番号: session[:user], 日付: date).try :入力済 || '0'
    if finish_flag == '1'
      render :show
    else
      render :index
    end
  end

  def finish_input
    date = params[:date].to_date
    kintai = Kintai.find_by 日付: date, 社員番号: session[:user]
    kintai.入力済 = '1' if kintai
    message = t "app.flash.kintai_finish_input" if kintai.save
    data = {message: message}
    respond_to do |format|
      format.json { render json: data}
    end
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

  # def summary_kintai
  #   case params[:id]
  #     when 'kintaisum'
  #       current_month = Kintai.current_month
  #       sum1 = current_month.sum('実労働時間')
  #       sum2 = current_month.sum('遅刻時間')
  #       sum3 = current_month.sum('普通残業時間')
  #       sum4 = current_month.sum('深夜残業時間')
  #       sum5 = current_month.sum('普通保守時間')
  #       sum6 = current_month.sum('深夜保守時間')
  #       data = {sum1: sum1, sum2: sum2, sum3: sum3, sum4: sum4, sum5: sum5, sum6: sum6}
  #       respond_to do |format|
  #         format.json { render json: data}
  #       end
  #   end
  # end

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
