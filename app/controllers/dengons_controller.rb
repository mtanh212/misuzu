class DengonsController < ApplicationController
  before_action :set_dengon, only: [:show, :edit, :update, :destroy]

  respond_to :html
  include DengonsHelper

  def index
    @dengons = Dengon.all
    if params[:head].present?
      @shain_param = params[:head][:shainbango]
    else
      @shain_param = session[:user]
    end
    @yoken = params[:head][:youken] if params[:head].present?
    @kaitou = params[:head][:kaitou] if params[:head].present?

    @dengons = @dengons.where(社員番号: @shain_param) if @shain_param.present?
    @dengons = @dengons.where(用件: @yoken) if @yoken.present?
    @dengons = @dengons.where(回答: @kaitou) if @kaitou.present?

    respond_with(@dengons)
  end

  def show
    respond_with(@dengon)
  end

  def new
    @dengon = Dengon.new
    @dengon.input_user = Shainmaster.find session[:user]
    respond_with(@dengon)
  end

  def edit
  end

  def create
    @dengon = Dengon.new(dengon_params)
    @dengon.save
    # respond_with(@dengon)
    update_dengon_counter()
    mail_to = Tsushinseigyou.find_by!(社員番号: dengon_params[:社員番号]).メール;
    send_mail(mail_to, dengon_params[:回答], dengon_params[:伝言内容])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = t "app.flash.mail_to"
  rescue Net::SMTPFatalError
    flash[:notice] = t "app.flash.mail_send_field"
  ensure
    redirect_to dengons_url
  end

  def update
    @dengon.update(dengon_params)
    # respond_with(@dengon)
    update_dengon_counter()
    mail_to = Tsushinseigyou.find_by!(社員番号: dengon_params[:社員番号]).メール;
    send_mail(mail_to, dengon_params[:回答], dengon_params[:伝言内容])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = t "app.flash.mail_to"
  rescue Net::SMTPFatalError
    flash[:notice] = t "app.flash.mail_send_field"
  ensure
    redirect_to dengons_url
  end

  def destroy
    @dengon.destroy
    respond_with(@dengon)
  end

  private
    def set_dengon
      @dengon = Dengon.find(params[:id])
    end

    def dengon_params
      params.require(:dengon).permit(:from1, :from2, :日付, :入力者, :社員番号, :用件, :回答, :伝言内容, :確認, :送信)
    end
end
