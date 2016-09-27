class Kanris::KintaisController < ApplicationController
  before_action :require_kanriG_user!
  def index
    @shainmasters = Shainmaster.all.page(params[:page]).per(10)
    if params[:date].present?
      @date = params[:date].to_date
    else
      @date = Date.today.to_date
    end
    if params[:user_name].present?
      @user_name = params[:user_name]
      @shainmasters = Shainmaster.all.where(社員番号: @user_name).
        page(params[:page]).per(10)
    end
  end

  def show
    @shainmaster = Shainmaster.find_by id: params[:id]
    @kintais = @shainmaster.kintais
    @date = Date.today
    @date = params[:date].to_date if params[:date].present?
    check_kintai_at_day_by_user(@shainmaster.id, @date)
    @kintais = @kintais.where(日付: @date.beginning_of_month..@date.end_of_month).
      order(:日付) if params[:date].present?
  end
end
