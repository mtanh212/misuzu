class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy]
  before_action :set_param, only: [ :create, :new, :show, :edit, :update, :destroy]
  # load_and_authorize_resource
  respond_to :json
  
  include EventsHelper
  
  def index
    @all_events = Event.where("Date(開始) = ?", Date.today.to_s(:db))
    begin
      @events = Shainmaster.find(session[:selected_shain]).events.where("Date(開始) >= ?", (Date.today - 1.month).to_s(:db)).order(開始: :desc)
    rescue
      @events = Shainmaster.take.events
    end
    @shains = Shainmaster.order(:所属コード, :役職コード, :社員番号).all
    @holidays = JptHolidayMst.all 
    
    @shain = Shainmaster.find(session[:selected_shain])
    
    # 不在状態の社員
    # check_user_status()
    
    # @shain_names = @shains.select :id, :title
    # respond_with(@shain_names) do |format|
    #   format.json {
    #     render json: {
    #                :shains => @shain_names,
    #                :events => @events
    #            }}
    # end
  end
   
  def edit
    # @event.build_joutaimaster if @event.joutaimaster.nil?
  end
  
  def new
    # shainbango = User.find(session[:user]).shainmaster.shain_no
    @event = Event.new shain_no: Shainmaster.find(session[:selected_shain]).id
    # @event.build_joutaimaster
  end
  
  def create
    @event = User.find(session[:user]).shainmaster.events.new event_params
    # set_fkey @event, event_params

    flash[:notice] = t 'app.flash.new_success' if @event.save

    # if @event.save
    #   flash[:notice] = t 'app.flash.new_success' 
    # else
    #   @event.build_joutaimaster
    # end
    
    respond_with @event, location: events_url
  end

  def update
    case params[:commit]
      when '　削除　'
        flash[:notice] = t 'app.flash.delete_success' if @event.destroy
        respond_with @event, location: events_url

      when '　登録　'
        set_fkey @event, event_params
        flash[:notice] = t 'app.flash.update_success' if @event.update event_params
        # joutai = Joutaimaster.find_by code: event_params[:状態コード]
        # joutai.update color: params['input-backgroud-color'], text_color: params['input-text-color']
        respond_with @event, location: events_url
    end
  end

  def custom
    # if  params[:commit].nil?
    #   shozai_id = params[:shain][:shozai_id]
    #   shozai = Shozai.find shozai_id
    #   shain = User.find(session[:user]).shainmaster
    #   shain.shozai = shozai if shozai
    #   shain.save
    #   redirect_to events_url
    # end
    case params[:commit]
      when '　ＯＫ　'
        # session[:selected_shain] = Shainmaster.find(params[:selected_user]).id
        session[:selected_shain] = params[:selected_user]
        respond_with @event, location: events_url
      when '勤務'
        redirect_to kintais_url
      when '経費'
        # redirect_to keihis_url
        redirect_to new_keihihead_url
    end
  end

  def ajax
   case params[:id]
     when 'event_状態コード'
       joutai = Joutaimaster.find_by(状態コード: params[:event_joutai_code])
       # event= [{id: '1', resourceId: 'b', start: '2015-08-07 10:00:00', end: '2015-08-07 14:00:00', title: joutai.name }]
       # data = {joutai_name: joutai.name, event: event, event_color: joutai.color, event_text_color: joutai.text_color}
       data = {joutai_name: joutai.name}
       respond_to do |format|
         format.json { render json: data}
       end
     when 'event_場所コード'
       basho_name = Bashomaster.find_by(場所コード: params[:event_basho_code]).try(:場所名)
       data = {basho_name: basho_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when 'event_工程コード'
       koutei_name = get_koutei_name(params[:event_koutei_code],session[:user])
       data = {koutei_name: koutei_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when 'event_job'
       job_name = Jobmaster.find_by(job番号: params[:event_job_code]).try(:job名)
       data = {job_name: job_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when 'save_kinmu_type'
       kinmu_type = params[:data]
       shain = Shainmaster.find(session[:user])
       if shain.update(勤務タイプ: kinmu_type)
         return_data = {message: 'OK'}
       else
         return_data = {message: 'NotOK'}
       end
       respond_to do |format|
         format.json { render json: return_data}
       end
     when 'change_shozai'
       shozai_id = params[:data]
       shozai = Shozai.find(shozai_id)
       shain = User.find(session[:selected_shain]).shainmaster
       shain.shozai = shozai if shozai
       if shain.save
         return_data = {message: 'OK'}
       else
         return_data = {message: 'NotOK'}
       end
       respond_to do |format|
         format.json { render json: return_data}
       end
   end
  end

private
# Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
  
  def set_param
    @jobs = Jobmaster.all
    @shozais = Shozai.all
    @bashos = Bashomaster.all
    @joutais = Joutaimaster.web_use.all
    # @kouteis = User.find(session[:user]).shainmaster.shozokumaster.kouteimasters
    @kouteis = Shainmaster.find(session[:selected_shain]).shozokumaster.kouteimasters
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:社員番号, :開始, :終了, :状態コード, :場所コード, :JOB, :所属コード, :工程コード, :工数, 
                                  :計上, :所在コード, :comment, :帰社区分) 
  end
end