class TsushinseigyousController < ApplicationController
  before_action :set_tsushinseigyou, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tsushinseigyous = Tsushinseigyou.all
    respond_with(@tsushinseigyous)
  end

  def show
    respond_with(@tsushinseigyou)
  end

  def new
    @tsushinseigyou = Tsushinseigyou.new
    respond_with(@tsushinseigyou)
  end

  def edit
  end

  def create
    @tsushinseigyou = Tsushinseigyou.new(tsushinseigyou_params)
    @tsushinseigyou.save
    respond_with(@tsushinseigyou, location: tsushinseigyous_url)
  end

  def update
    @tsushinseigyou.update(tsushinseigyou_params)
    respond_with(@tsushinseigyou, location: tsushinseigyous_url)
  end

  def destroy
    @tsushinseigyou.destroy
    respond_with(@tsushinseigyou)
  end

  private
    def set_tsushinseigyou
      @tsushinseigyou = Tsushinseigyou.find(params[:id])
    end

    def tsushinseigyou_params
      params.require(:tsushinseigyou).permit(:社員番号, :メール, :送信許可区分)
    end
end
