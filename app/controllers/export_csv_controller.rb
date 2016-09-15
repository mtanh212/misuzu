class ExportCsvController < ApplicationController
  before_action :check_user, only: :index
  def index
  end

  private
  def check_user
    redirect_to root_path unless current_user.shainmaster.shozokumaster.所属コード == "3"
  end
end
