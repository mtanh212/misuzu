class ShozokumastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_shozokumaster, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :js
  
  def index
    @shozokumasters = Shozokumaster.all
  end

  def show

  end

  def new
    @shozokumaster = Shozokumaster.new
  end

  def edit

  end

  def create
    @shozokumaster = Shozokumaster.new(shozokumaster_params)
    
    flash[:notice] = t "app.flash.new_success" if @shozokumaster.save
    respond_with @shozokumaster

  end

  def update
    
    flash[:notice] = t "app.flash.update_success" if @shozokumaster.update shozokumaster_params
    respond_with @shozokumaster
    
  end

  def destroy
    @shozokumaster.destroy
    respond_with @shozokumaster, location: shozokumasters_url
    
  end

  private

  def shozokumaster_params
    params.require(:shozokumaster).permit(:所属コード, :所属名)
  end

  def set_shozokumaster
    @shozokumaster = Shozokumaster.find(params[:id])
  end
end