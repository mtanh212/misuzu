class KaishamastersController < ApplicationController
  before_action :set_kaishamaster, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :js

  def index
    @kaishamasters = Kaishamaster.all
    respond_with(@kaishamasters)
  end

  def show
    respond_with(@kaishamaster)
  end

  def new
    @kaishamaster = Kaishamaster.new
    respond_with(@kaishamaster)
  end

  def edit
  end

  def create
    @kaishamaster = Kaishamaster.new(kaishamaster_params)
    flash[:notice] = t "app.flash.new_success" if @kaishamaster.save
    respond_with(@kaishamaster)
  end

  def update
    flash[:notice] = t "app.flash.update_success" if @kaishamaster.update(kaishamaster_params_for_update)
    respond_with(@kaishamaster)
  end

  def destroy
    @kaishamaster.destroy
    respond_with(@kaishamaster, location: kaishamasters_url)
  end

  def import
    Kaishamaster.delete_all
    Kaishamaster.reset_pk_sequence
    Kaishamaster.import(params[:file])
    notice = t 'app.flash.import_csv'
    redirect_to :back, notice: notice
  end

  private
    def set_kaishamaster
      @kaishamaster = Kaishamaster.find(params[:id])
    end

    def kaishamaster_params
      params.require(:kaishamaster).permit(:id, :name, :note)
    end

    def kaishamaster_params_for_update
      params.require(:kaishamaster).permit(:name, :note)
    end
end
