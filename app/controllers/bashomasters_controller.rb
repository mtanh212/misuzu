class BashomastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bashomaster, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :js
  
  def index
    @bashomasters = Bashomaster.all
  end


  def show

  end

  def new
    @bashomaster = Bashomaster.new
  end

  def edit

  end

  def create
    @bashomaster = Bashomaster.new(bashomaster_params)
    flash[:notice] = "Basho was created successfuly." if @bashomaster.save
    respond_with @bashomaster
  end

  def update
    flash[:notice] = "Basho was update successfuly" if @bashomaster.update bashomaster_params
    respond_with @bashomaster
  end

  def destroy
    @bashomaster.destroy
    respond_with @bashomaster, location: bashomasters_url
  end

  private

  def bashomaster_params
    params.require(:bashomaster).permit(:社員番号, :場所コード, :場所名, :場所名カナ, :SUB, :場所区分,:会社コード)
  end

  def set_bashomaster
    @bashomaster = Bashomaster.find(params[:id])
  end
end