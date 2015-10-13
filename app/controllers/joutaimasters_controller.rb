class JoutaimastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_joutaimaster, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :js
  
  def index
    @joutaimasters = Joutaimaster.all
  end

  def show

  end

  def new
    @joutaimaster = Joutaimaster.new
  end

  def edit

  end

  def create
    @joutaimaster = Joutaimaster.new(joutaimaster_params)

    flash[:notice] = t "app.flash.new_success" if @joutaimaster.save
    respond_with @joutaimaster
    
  end

  def update

    flash[:notice] = t "app.flash.update_success" if @joutaimaster.update joutaimaster_params
    respond_with @joutaimaster

  end

  def destroy
    @joutaimaster.destroy
    respond_with @joutaimaster, location: joutaimasters_url 
    
  end

  private

  def joutaimaster_params
    params.require(:joutaimaster).permit(:状態コード, :状態名, :状態区分, :勤怠状態名, :マーク, :色, :text_color, :WEB使用区分, :勤怠使用区分)
  end

  def set_joutaimaster
    @joutaimaster = Joutaimaster.find(params[:id])
  end
end