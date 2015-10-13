class KeihisController < ApplicationController
  before_action :set_keihi, only: [:index]
  respond_to :js

  def index
    respond_with @keihis
  end

  private
  def set_keihi
    @keihis = Keihihead.all
  end
end