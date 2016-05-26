class KairansController < ApplicationController
  before_action :set_kairan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kairans = Kairan.all
    respond_with(@kairans)
  end

  def show
    respond_with(@kairan)
  end

  def new
    @kairan = Kairan.new
    respond_with(@kairan)
  end

  def edit
  end

  def create
    @kairan = Kairan.new(kairan_params)
    flash[:notice] = t "app.flash.new_success" if @kairan.save
    respond_with(@kairan, location: kairans_url)
  end

  def update
    flash[:notice] = t "app.flash.update_success" if @kairan.update(kairan_params)
    respond_with(@kairan)
  end

  def destroy
    @kairan.destroy
    respond_with(@kairan, location: kairans_url)
  end

  private
    def set_kairan
      @kairan = Kairan.find(params[:id])
    end

    def kairan_params
      params.require(:kairan).permit(:発行者, :要件, :開始, :終了, :件名, :内容, :確認)
    end
end
