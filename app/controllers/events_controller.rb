class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy]
  before_action :set_param, only: [ :create, :new, :show, :edit, :update, :destroy]
  # load_and_authorize_resource
  respond_to :json
  
  include EventsHelper
  
  def index
    @all_events = Event.all
    begin
      @events = Shainmaster.find(session[:selected_shain]).events.order(開始: :desc)
    rescue
      @events = Shainmaster.take.events
    end
    @shains = Shainmaster.order(:所属コード,:役職コード,:社員番号).all
    
    @holidays = JptHolidayMst.all 
    
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
  end
  
  def new
    shainbango = User.find(session[:user]).shainmaster.社員番号
    @event = Event.new(社員番号: shainbango)
  end
  
  def create
    @event = User.find(session[:user]).shainmaster.events.new event_params
    set_fkey @event, event_params
    flash[:notice] = t 'app.flash.new_success' if @event.save
    respond_with @event, location: events_url
  end

  def update
    case params[:commit]
      when '　削除　'
        @event.destroy
        respond_with @event, location: events_url

      when '　登録　'
        set_fkey @event, event_params
        flash[:notice] = t 'app.flash.update_success' if @event.update event_params
        respond_with @event, location: events_url
    end
  end
  
  def change_user
    session[:selected_shain] = Shainmaster.find_by(社員番号: params[:selected_user]).id
    respond_with @event, location: events_url
  end
  
  def ajax
   case params[:id]
     when "event_状態コード"
       joutai_name = Joutaimaster.find_by(状態コード: params[:event_joutai_code]).try(:状態名)
       data = {joutai_name: joutai_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when "event_場所コード"
       basho_name = Bashomaster.find_by(場所コード: params[:event_basho_code]).try(:場所名)
       data = {basho_name: basho_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when "event_工程コード"
       koutei_name = get_koutei_name(params[:event_koutei_code],session[:user])
       data = {koutei_name: koutei_name}
       respond_to do |format|
         format.json { render json: data}
       end
     when "event_job"
       job_name = Jobmaster.find_by(job番号: params[:event_job_code]).try(:job名)
       data = {job_name: job_name}
       respond_to do |format|
         format.json { render json: data}
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
    @joutais = Joutaimaster.all
    @kouteis = User.find(session[:user]).shainmaster.shozokumaster.kouteimasters
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:社員番号, :開始, :終了, :状態コード, :場所コード, :JOB, :所属コード, :工程コード, :工数, :計上, :所在コード, :comment, :帰社区分)
  end
end