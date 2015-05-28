class BashomastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bashomaster, only: [:show, :edit, :update, :destroy]

  def index
    @bashomasters = Bashomaster.all
  end


  def show

  end

  def new
    @bashomaster = Bashomaster.new
  end

  def edit

  end

  def create
    @bashomaster = Bashomaster.new(bashomaster_params)

    # if !param_valid
    #   Rails.logger.info 'Param check error'
    #   @errors = ["所属コードが間違っています。"]
    #   respond_to do |format|
    #     format.html {render action: 'new'}
    #   end
    #   return
    # end

    respond_to do |format|
      if @bashomaster.save
        format.html { redirect_to @bashomaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @bashomaster }
        format.js { render action: 'show', status: :created, location: @bashomaster }
      else
        format.html { render 'new'}
        format.json { render json: @bashomaster.errors, status: :unprocessable_entity }
        format.js { render json: @bashomaster.errors, status: :unprocessable_entity }
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
      if @bashomaster.update(bashomaster_params)
        format.html { redirect_to bashomasters_url, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bashomaster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bashomaster.destroy
    respond_to do |format|
      format.html { redirect_to bashomasters_url }
      format.json { head :no_content }
      format.js {}
    end

  end

  private

  def bashomaster_params
    params.require(:bashomaster).permit(:社員番号, :場所コード, :場所名, :場所名カナ, :SUB, :場所区分,:会社コード)
  end

  def set_bashomaster
    @bashomaster = Bashomaster.find(params[:id])
  end
end