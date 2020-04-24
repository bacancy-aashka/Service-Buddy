class AdminController < ApplicationController
  before_action :authenticate_user! 
  before_action :check_user
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_admin

  def index
    @user = User.ransack(params[:q])
    @users_result = @user.result(distinct: true).paginate(per_page: 3, page: params[:page])
  end

  private

  def check_user
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def invalid_admin
    redirect_to root_path
  end
end
