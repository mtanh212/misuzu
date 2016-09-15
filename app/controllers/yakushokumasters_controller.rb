class YakushokumastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_yakushokumaster, only: [:show, :edit, :update, :destroy]
  respond_to :js
  load_and_authorize_resource

  def index
    @yakushokumasters = Yakushokumaster.all
  end

  def show
  end

  def new
    @yakushokumaster = Yakushokumaster.new
  end

  def edit
  end

  def create
    @yakushokumaster = Yakushokumaster.new(yakushokumaster_params)
    flash[:notice] = t "app.flash.new_success" if @yakushokumaster.save
    respond_with @yakushokumaster
  end


  def update
    flash[:notice] = t "app.flash.update_success" if @yakushokumaster.update yakushokumaster_params_for_update
    respond_with @yakushokumaster

  end

  def destroy
    @yakushokumaster.destroy
    respond_with @yakushokumaster, location: yakushokumasters_url
  end

  def import
    if params[:file].nil?
      flash[:alert] = t "app.flash.file_nil"

      redirect_to yakushokumasters_path
    else
      Yakushokumaster.delete_all
      Yakushokumaster.reset_pk_sequence
      Yakushokumaster.import(params[:file])
      notice = t 'app.flash.import_csv'
      redirect_to :back, notice: notice
    end
  end

  def export_csv
    @yakushokumasters = Yakushokumaster.all

    respond_to do |format|
      format.html
      format.csv { send_data @yakushokumasters.to_csv, filename: "役職マスタ_#{Date.today}.csv" }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_yakushokumaster
    @yakushokumaster = Yakushokumaster.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def yakushokumaster_params
    params.require(:yakushokumaster).permit(:役職コード, :役職名)
  end

  def yakushokumaster_params_for_update
    params.require(:yakushokumaster).permit(:役職名)
  end

end
