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

    flash[:notice] = "Yakushoku was created successfuly." if @yakushokumaster.save
    respond_with @yakushokumaster
    
  end
    
  
  def update
    flash[:notice] = "Yakushoku was update successfuly." if @yakushokumaster.update yakushokumaster_params
    respond_with @yakushokumaster

  end
  
  def destroy
    @yakushokumaster.destroy
    respond_with @yakushokumaster, location: yakushokumasters_url
    
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

end
