class BunruisController < ApplicationController
  before_action :set_bunrui, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bunruis = Bunrui.all
    respond_with(@bunruis)
  end

  def show
    respond_with(@bunrui)
  end

  def new
    @bunrui = Bunrui.new
    respond_with(@bunrui)
  end

  def edit
  end

  def create
    @bunrui = Bunrui.new(bunrui_params)
    flash[:notice] = t 'app.flash.new_success' if @bunrui.save
    respond_with(@bunrui)
  end

  def update
    flash[:notice] = t 'app.flash.update_success' if @bunrui.update(bunrui_params)
    respond_with(@bunrui)
  end

  def destroy
    @bunrui.destroy
    respond_with(@bunrui)
  end

  private
    def set_bunrui
      @bunrui = Bunrui.find(params[:id])
    end

    def bunrui_params
      params.require(:bunrui).permit(:分類コード, :分類名)
    end
end
