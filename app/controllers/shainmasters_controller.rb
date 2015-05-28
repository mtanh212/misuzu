class ShainmastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_shainmaster, only: [:show, :edit, :update, :destroy]
  
  def index
    @shains = Shainmaster.all
  end
  
  def show
    
  end
  
  def new
    @shainmaster = Shainmaster.new
  end
  
  def edit
    
  end
  
  def create
    @shainmaster = Shainmaster.new(shainmaster_params)

    # if !param_valid
    #   Rails.logger.info 'Param check error'
    #   @errors = ["所属コードが間違っています。"]
    #   respond_to do |format|
    #     format.html {render action: 'new'}
    #   end
    #   return
    # end

    respond_to do |format|
      if @shainmaster.save
        format.html { redirect_to @shainmaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @shainmaster }
        format.js { render action: 'show', status: :created, location: @shainmaster }
      else
        format.html { render 'new'}
        format.json { render json: @shainmaster.errors, status: :unprocessable_entity }
        format.js { render json: @shainmaster.errors, status: :unprocessable_entity }
        # format.js { render 'show' }
      end
    end
  end
  
  def update
    # if !param_valid
    #   Rails.logger.info 'Param check error'
    #   @errors = ["所属コードが間違っています。"]
    #   respond_to do |format|
    #     format.html {render action: 'edit'}
    #   end
    #   return
    # end
    respond_to do |format|
      if @shainmaster.update(shainmaster_params)
        format.html { redirect_to shainmasters_url, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shainmaster.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @shainmaster.destroy
    respond_to do |format|
      format.html { redirect_to shainmasters_url }
      format.json { head :no_content }
      format.js {}
    end

  end
  
private
  
  def shainmaster_params
    params.require(:shainmaster).permit(:社員番号, :連携用社員番号, :氏名, :所属コード, :直間区分, :役職コード)
  end

  def set_shainmaster
    @shainmaster = Shainmaster.find(params[:id])
  end
end
