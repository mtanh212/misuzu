class EkisController < ApplicationController
  before_action :set_eki, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @ekis = Eki.all
    respond_with(@ekis)
  end

  def show
    respond_with(@eki)
  end

  def new
    @eki = Eki.new
    respond_with(@eki)
  end

  def edit
  end

  def create
    @eki = Eki.new(eki_params)
    @eki.save
    respond_with(@eki)
  end

  def update
    @eki.update(eki_params_for_update)
    respond_with(@eki)
  end

  def destroy
    @eki.destroy
    respond_with(@eki)
  end

  def import
    Eki.delete_all
    Eki.reset_pk_sequence
    Eki.import(params[:file])
    notice = t 'app.flash.import_csv'
    redirect_to :back, notice: notice
  end

  private
    def set_eki
      @eki = Eki.find(params[:id])
    end

    def eki_params
      params.require(:eki).permit(:駅コード, :駅名)
    end

    def eki_params_for_update
      params.require(:eki).permit(:駅名)
    end
end
