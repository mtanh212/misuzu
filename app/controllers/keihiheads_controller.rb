class KeihiheadsController < ApplicationController
  before_action :set_keihi, only: [:show, :edit, :update, :destroy]
  before_action :set_modal, only: [:new, :edit, :update, :destroy]

  respond_to :js

  def index

  end

  def show
  end

  def new
    @keihi = Keihihead.new
    shinsheino = 1
    shinsheino = Keihihead.maximum(:id) + 1 if Keihihead.exists?
    @keihi.shinsheino = shinsheino
    @keihi.keihibodys.build

    respond_with(@keihi)
  end

  def edit
    @keihi.keihibodys.build
  end

  def create
    case params[:commit]
      when '経費データ検索'
        @keihi = Keihihead.find_by(shinsheino: keihi_params[:shinsheino])
        if @keihi
          redirect_to edit_keihihead_url(@keihi)

        else
          flash[:warning] = t "app.flash.record_not_found"
          # @keihi = Keihihead.new shinsheino: keihi_params[:shinsheino]
          redirect_to :back
          # respond_with(@keihi, location: keihi_url(@keihi))
        end

      when '登　録'
        @keihi = Keihihead.new(keihi_params)
        flash[:notice] = t 'app.flash.new_success' if @keihi.save
        # respond_with(@keihi, location: keihis_url)
        redirect_to new_keihihead_url
    end

  end

  def update
    case params[:commit]
      when '登　録'
        flash[:notice] = t "app.flash.update_success" if @keihi.update(keihi_params)
        # respond_with(@keihi)
        redirect_to new_keihihead_url
      when '削　除'
        flash[:notice] = t "app.flash.delete_success" if @keihi.destroy
        respond_with @keihi, location: new_keihihead_url
    end
  end

  def destroy
    @keihi.destroy
    respond_with(@keihi, location: new_keihihead_url)
  end

  private
  def set_keihi
    @keihi = Keihihead.find(params[:id])
  end
  
  def set_modal
    @kaishamasters = Kaishamaster.all
    @kikans = Kikan.all
    @ekis = Eki.all
  end

  def keihi_params
    params.require(:keihihead).permit(:shinsheino, :日付, :社員番号, :申請者, :交通費合計, :日当合計, :宿泊費合計, :その他合計,
                                      :旅費合計, :仮払金, :合計, :支給品, :過不足, :承認kubun, :承認者, :清算予定日, :清算日,
                                      keihibodys_attributes: [:id, :shinsheino, :line_no, :日付, :社員番号, :相手先, :機関名,
                                                              :発, :着, :発着kubun, :交通費, :日当, :宿泊費, :その他, :JOB,
                                                              :備考, :領収書kubun, :_destroy])
  end
end
