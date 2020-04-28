class AdminController < ApplicationController
  
  before_action :authenticate_user! 
  before_action :check_user
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_admin

  def index
    @user = User.ransack(params[:q])
    @users_result = @user.result(distinct: true).paginate(per_page: 3, page: params[:page])
  end

  def show_provider_detail
    @provider_detail = ProviderDetail.find(params[:id])
    if @provider_detail.email_confirmed?
      redirect_to pending_provider_details_admin_index_path
    end
  end

  def pending_provider_details
    if params[:query].present?
      @pending_provider_details = ProviderDetail.searching(params[:query]).paginate(per_page: 5, page: params[:page])
    else
      @pending_provider_details = ProviderDetail.where(email_confirmed: false).paginate(per_page: 5, page: params[:page])
    end
  end

  def delete_provider_detail
    if ProviderDetail.find(params[:id]).destroy
      redirect_to pending_provider_details_admin_index_path, notice: 'Provider\'s detail was successfully destroyed.' 
    end
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
