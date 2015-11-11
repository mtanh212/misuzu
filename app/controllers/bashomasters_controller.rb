class BashomastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bashomaster, only: [:new, :create, :show, :edit, :update, :destroy]
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
    @bashomaster.kaishamaster = Kaishamaster.find_by code: bashomaster_params[:会社コード]
    flash[:notice] = t "app.flash.new_success" if @bashomaster.save
    respond_with @bashomaster
  end

  def update
    @bashomaster.kaishamaster = Kaishamaster.find_by code: bashomaster_params[:会社コード]
    flash[:notice] = t "app.flash.update_success" if @bashomaster.update bashomaster_params
    respond_with @bashomaster
  end

  def destroy
    @bashomaster.destroy
    respond_with @bashomaster, location: bashomasters_url
  end

  def ajax
    case params[:focus_field]
      when "bashomaster_会社コード"
        kaisha_name = Kaishamaster.find_by(code: params[:kaisha_code]).try :name
        data = {kaisha_name: kaisha_name}
        respond_to do |format|
          format.json { render json: data}
        end
    end
  end

  def import
    Bashomaster.delete_all
    Bashomaster.reset_pk_sequence
    Bashomaster.import(params[:file])
    notice = t 'app.flash.import_csv'
    redirect_to :back, notice: notice
  end
  
  private

  def bashomaster_params
    params.require(:bashomaster).permit(:社員番号, :場所コード, :場所名, :場所名カナ, :SUB, :場所区分,:会社コード)
  end

  def set_bashomaster
    @bashomaster = Bashomaster.find(params[:id])
    @kaishamasters = Kaishamaster.all
  end
  
end