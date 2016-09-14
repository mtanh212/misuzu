class KairanyokenmstsController < ApplicationController
  before_action :set_kairanyokenmst, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kairanyokenmsts = Kairanyokenmst.all
    respond_with(@kairanyokenmsts)
  end

  def show
    respond_with(@kairanyokenmst)
  end

  def new
    @kairanyokenmst = Kairanyokenmst.new
    respond_with(@kairanyokenmst)
  end

  def edit
  end

  def create
    @kairanyokenmst = Kairanyokenmst.new(kairanyokenmst_params)
    flash[:notice] = t "app.flash.new_success" if @kairanyokenmst.save
    respond_with(@kairanyokenmst, location: kairanyokenmsts_url)

  end

  def update
    flash[:nitice] = t "app.flash.update_success" if @kairanyokenmst.update(kairanyokenmst_params)
    respond_with(@kairanyokenmst, location: kairanyokenmsts_url)
  end

  def destroy
    @kairanyokenmst.destroy
    respond_with(@kairanyokenmst, location: kairanyokenmsts_url)
  end

  def import
    if params[:file].nil?
      flash[:alert] = "app.flash.file.nil"
      redirect_to kairanyokenmsts_path
    else
      Kairanyokenmst.delete_all
      Kairanyokenmst.reset_pk_sequence
      Kairanyokenmst.import(params[:file])
      notice = t 'app.flash.import_csv'
      redirect_to :back, notice: notice
    end
  end

  private
    def set_kairanyokenmst
      @kairanyokenmst = Kairanyokenmst.find(params[:id])
    end

    def kairanyokenmst_params
      params.require(:kairanyokenmst).permit(:名称, :備考)
    end
end
