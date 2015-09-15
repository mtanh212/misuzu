class JobmastersController < ApplicationController
  before_action :set_jobmaster, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :js
  
  # GET /jobmasters
  # GET /jobmasters.json
  def index
    @jobmasters = Jobmaster.all
  end

  # GET /jobmasters/1
  # GET /jobmasters/1.json
  def show
  end

  # GET /jobmasters/new
  def new
    @jobmaster = Jobmaster.new
  end

  # GET /jobmasters/1/edit
  def edit
  end

  # POST /jobmasters
  # POST /jobmasters.json
  def create
    @jobmaster = Jobmaster.new(jobmaster_params)

    flash[:notice] = "Job was created successfuly." if @jobmaster.save
    respond_with @jobmaster
    
  end

  # PATCH/PUT /jobmasters/1
  # PATCH/PUT /jobmasters/1.json
  def update
    
    flash[:notice] = "Job was created successfuly." if @jobmaster.update jobmaster_params
    respond_with @jobmaster
    
  end

  # DELETE /jobmasters/1
  # DELETE /jobmasters/1.json
  def destroy
    @jobmaster.destroy
    respond_with @jobmaster, location: jobmasters_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobmaster
      @jobmaster = Jobmaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobmaster_params
      params.require(:jobmaster).permit(:job番号, :job名, :開始日, :終了日, :ユーザ番号, :ユーザ名)
    end
end
