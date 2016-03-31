class DengonkaitousController < ApplicationController
  before_action :set_dengonkaitou, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dengonkaitous = Dengonkaitou.all
    respond_with(@dengonkaitous)
  end

  def show
    respond_with(@dengonkaitou)
  end

  def new
    @dengonkaitou = Dengonkaitou.new
    respond_with(@dengonkaitou)
  end

  def edit
  end

  def create
    @dengonkaitou = Dengonkaitou.new(dengonkaitou_params)
    @dengonkaitou.save
    respond_with(@dengonkaitou)
  end

  def update
    @dengonkaitou.update(dengonkaitou_params)
    respond_with(@dengonkaitou)
  end

  def destroy
    @dengonkaitou.destroy
    respond_with(@dengonkaitou)
  end

  private
    def set_dengonkaitou
      @dengonkaitou = Dengonkaitou.find(params[:id])
    end

    def dengonkaitou_params
      params.require(:dengonkaitou).permit(:first_name, :last_name)
    end
end
