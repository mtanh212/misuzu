class KikanmstsController < ApplicationController
  before_action :set_kikanmst, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @kikanmsts = Kikanmst.all
    respond_with(@kikanmsts)
  end

  def show
    respond_with(@kikanmst)
  end

  def new
    @kikanmst = Kikanmst.new
    respond_with(@kikanmst)
  end

  def edit
  end

  def create
    @kikanmst = Kikanmst.new(kikanmst_params)
    @kikanmst.save
    respond_with(@kikanmst)
  end

  def update
    @kikanmst.update(kikanmst_params)
    respond_with(@kikanmst)
  end

  def destroy
    @kikanmst.destroy
    respond_with(@kikanmst)
  end

  def import
    if params[:file].nil?
      flash[:alert] = "app.flash.csv.file.nil"
      redirect_to kikanmsts_path
    else
      Kikanmst.delete_all
      Kikanmst.reset_pk_sequence
      Kikanmst.import(params[:file])
      notice = t 'app.flash.import_csv'
      redirect_to :back, notice: notice
    end
  end

  private
    def set_kikanmst
      @kikanmst = Kikanmst.find(params[:id])
    end

    def kikanmst_params
      params.require(:kikanmst).permit(:機関コード, :機関名, :備考 )
    end
end
