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
    # shinsheino = Keihihead.maximum(:id) + 1 if Keihihead.exists?
    shinsheino = Keihihead.order(id: :desc).first.id.to_i + 1 if Keihihead.exists?
    @keihi.id = shinsheino.to_s
    @keihi.keihibodys.build

    respond_with(@keihi)
  end

  def edit
    @keihi.keihibodys.build
  end

  def create
    case params[:commit]
      when '経費データ検索'
        begin
          @keihi = Keihihead.find keihi_params[:申請番号]
          if @keihi.承認kubun == '1'
            redirect_to keihihead_url(@keihi)
          else
            redirect_to edit_keihihead_url(@keihi)
          end
        rescue ActiveRecord::RecordNotFound
          flash[:warning] = t "app.flash.record_not_found"
          redirect_to :back
          return
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

  def ajax
    case params[:id]
      when 'getshinshei'
        date = params[:date]
        listshinshei = Keihihead.where(日付: date, 社員番号: session[:user]).pluck(:申請番号)
        data = {listshinshei: listshinshei}
        respond_to do |format|
          format.json { render json: data}
        end
    end
  end
  
  private
  def set_keihi
    @keihi = Keihihead.find(params[:id])
  end
  
  def set_modal
    @kaishamasters = Kaishamaster.all
    @kikans = Kikanmst.all
    @ekis = Eki.all
    @shonins = Shoninshamst.all
    @jobs = Jobmaster.all
  end
  
  def keihi_params
    params.require(:keihihead).permit(:申請番号, :日付, :社員番号, :申請者, :交通費合計, :日当合計, :宿泊費合計, :その他合計,
                                      :旅費合計, :仮払金, :合計, :支給品, :過不足, :承認kubun, :承認者, :清算予定日, :清算日,
                                      keihibodys_attributes: [:id,:申請番号, :日付, :社員番号, :相手先, :機関名,
                                                              :発, :着, :発着kubun, :交通費, :日当, :宿泊費, :その他, :JOB,
                                                              :備考, :領収書kubun, :_destroy])
  end
end
