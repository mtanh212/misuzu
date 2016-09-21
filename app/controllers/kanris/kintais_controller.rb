class Kanris::KintaisController < ApplicationController
  before_action :require_kanriG_user!
  def index
    @kintais = Kintai.all.page(params[:page]).per(10) if params[:date].present? || params[:user_name].present?
    # @date_param = Date.today
    @date = params[:date].to_date if params[:date].present?
    @user_name = params[:user_name] if params[:user_name].present?
    # @date_param = params[:search]
    # @date_param = Date.today.to_date unless date_param.present?
    # byebug
    @kintais = @kintais.all.where(日付: @date.beginning_of_month..@date.end_of_month ).
      order(:日付).page(params[:page]).per(10) if params[:date].present?
    @kintais = @kintais.where(社員番号: @user_name).
      order(:日付).page(params[:page]).per(10) if params[:user_name].present?
  end
end
