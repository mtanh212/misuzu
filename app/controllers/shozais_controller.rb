class ShozaisController < ApplicationController
  before_action :set_shozai, only: [:show, :edit, :update, :destroy]

  respond_to :js

  def index
    @shozais = Shozai.all
    respond_with(@shozais)
  end

  def show
    respond_with(@shozai)
  end

  def new
    @shozai = Shozai.new
    respond_with(@shozai)
  end

  def edit
  end

  def create
    @shozai = Shozai.new(shozai_params)
    flash[:notice] = t 'app.flash.new_success' if @shozai.save
    respond_with(@shozai)
  end

  def update
    flash[:notice] = t 'app.flash.update_success' if @shozai.update(shozai_params)
    respond_with(@shozai)
  end

  def destroy
    @shozai.destroy
    respond_with @shozai, location: shozais_url
  end

  private
    def set_shozai
      @shozai = Shozai.find(params[:id])
    end

    def shozai_params
      params.require(:shozai).permit(:所在コード, :所在名)
    end
end
