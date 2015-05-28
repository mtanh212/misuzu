class ShozokumastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_shozokumaster, only: [:show, :edit, :update, :destroy]

  def index
    @shozokumasters = Shozokumaster.all
  end

  def show

  end

  def new
    @shozokumaster = Shozokumaster.new
  end

  def edit

  end

  def create
    @shozokumaster = Shozokumaster.new(shozokumaster_params)

    # if !param_valid
    #   Rails.logger.info 'Param check error'
    #   @errors = ["所属コードが間違っています。"]
    #   respond_to do |format|
    #     format.html {render action: 'new'}
    #   end
    #   return
    # end

    respond_to do |format|
      if @shozokumaster.save
        format.html { redirect_to @shozokumaster, notice: '新規成功出来ました。' }
        format.json { render action: 'show', status: :created, location: @shozokumaster }
        format.js { render action: 'show', status: :created, location: @shozokumaster }
      else
        format.html { render 'new'}
        format.json { render json: @shozokumaster.errors, status: :unprocessable_entity }
        format.js { render json: @shozokumaster.errors, status: :unprocessable_entity }
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
      if @shozokumaster.update(shozokumaster_params)
        format.html { redirect_to shozokumasters_url, notice: '更新成功できました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shozokumaster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shozokumaster.destroy
    respond_to do |format|
      format.html { redirect_to shozokumasters_url }
      format.json { head :no_content }
      format.js {}
    end

  end

  private

  def shozokumaster_params
    params.require(:shozokumaster).permit(:所属コード, :所属名)
  end

  def set_shozokumaster
    @shozokumaster = Shozokumaster.find(params[:id])
  end
end