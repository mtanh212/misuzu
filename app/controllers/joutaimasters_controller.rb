class JoutaimastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_joutaimaster, only: [:show, :edit, :update, :destroy]

  def index
    @joutaimasters = Joutaimaster.all
  end

  def show

  end

  def new
    @joutaimaster = Joutaimaster.new
  end

  def edit

  end

  def create
    @joutaimaster = Joutaimaster.new(joutaimaster_params)

    # if !param_valid
    #   Rails.logger.info 'Param check error'
    #   @errors = ["所属コードが間違っています。"]
    #   respond_to do |format|
    #     format.html {render action: 'new'}
    #   end
    #   return
    # end

    respond_to do |format|
      if @joutaimaster.save
        format.html { redirect_to @joutaimaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @joutaimaster }
        format.js { render action: 'show', status: :created, location: @joutaimaster }
      else
        format.html { render 'new'}
        format.json { render json: @joutaimaster.errors, status: :unprocessable_entity }
        format.js { render json: @joutaimaster.errors, status: :unprocessable_entity }
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
      if @joutaimaster.update(joutaimaster_params)
        format.html { redirect_to joutaimasters_url, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @joutaimaster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @joutaimaster.destroy
    respond_to do |format|
      format.html { redirect_to joutaimasters_url }
      format.json { head :no_content }
      format.js {}
    end

  end

  private

  def joutaimaster_params
    params.require(:joutaimaster).permit(:状態コード, :状態名, :状態区分, :勤怠状態名, :マーク, :色, :WEB使用区分, :勤怠使用区分)
  end

  def set_joutaimaster
    @joutaimaster = Joutaimaster.find(params[:id])
  end
end