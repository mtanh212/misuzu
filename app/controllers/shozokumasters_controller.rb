class ShozokumastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource
  respond_to :js

  def index
  end

  def show
  end

  def new
  end

  def edit

  end

  def create
    flash[:notice] = t "app.flash.new_success" if @shozokumaster.save
    respond_with @shozokumaster

  end

  def update
    flash[:notice] = t "app.flash.update_success" if @shozokumaster.
      update_attributes shozokumaster_params
    respond_with @shozokumaster
  end

  def destroy
    @shozokumaster.destroy
    respond_with @shozokumaster, location: shozokumasters_url
  end

  def import
    if params[:file].nil?
      redirect_to shozokumasters_path
    else
      Shozokumaster.delete_all
      Shozokumaster.reset_pk_sequence
      Shozokumaster.import(params[:file])
      notice = t 'app.flash.import_csv'
      redirect_to :back, notice: notice
    end
  end

  private
  def shozokumaster_params
    params.require(:shozokumaster).permit :所属コード, :所属名
  end
end
