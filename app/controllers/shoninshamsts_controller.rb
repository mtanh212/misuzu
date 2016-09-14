class ShoninshamstsController < ApplicationController
  before_action :set_shoninshamst, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @shoninshamsts = Shoninshamst.all
    respond_with(@shoninshamsts)
  end

  def show
    respond_with(@shoninshamst)
  end

  def new
    @shoninshamst = Shoninshamst.new
    respond_with(@shoninshamst)
  end

  def edit
  end

  def create
    @shoninshamst = Shoninshamst.new(shoninshamst_params)
    @shoninshamst.save
    respond_with(@shoninshamst)
  end

  def update
    @shoninshamst.update(shoninshamst_params)
    respond_with(@shoninshamst)
  end

  def destroy
    @shoninshamst.destroy
    respond_with(@shoninshamst)
  end

  def import
    if params[:file].nil?
      flash[:alert] = "app.flash.csv.file.nil"
      redirect_to shoninshamsts_path
    else
    Shoninshamst.delete_all
    Shoninshamst.reset_pk_sequence
    Shoninshamst.import(params[:file])
    notice = t 'app.flash.import_csv'
    redirect_to :back, notice: notice
  end
  end

  private
    def set_shoninshamst
      @shoninshamst = Shoninshamst.find(params[:id])
    end

    def shoninshamst_params
      params.require(:shoninshamst).permit(:申請者, :承認者, :順番)
    end
end
