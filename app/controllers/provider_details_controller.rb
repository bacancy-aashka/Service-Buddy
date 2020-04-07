class ProviderDetailsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_provider_details, only: %i[edit update]
  before_action :check_provider, only: %i[edit]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_provider_details
  # before_action :is_provider?, only: [:create]


  def new
    @provider_detail = ProviderDetail.new
  end

  def index
    @cities = CS.cities(params[:state])
  end    

  def create
    if Provider.find_by(user_id: current_user.id).present?
      provider = Provider.find_by(user_id: current_user.id)
    else 
      provider = Provider.create(user_id: current_user.id)
      provider.save
    end

    @provider_detail = ProviderDetail.create(provider_id: provider.id)
    @provider_detail.update(provider_detail_params)

    if @provider_detail.save
      redirect_to user_path(current_user), notice: 'Your adderess successfully added to your profile.' 
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @provider_detail.update(provider_detail_params)
      redirect_to user_path(current_user), notice: 'Your adderess is successfully edited.' 
    else
      render :edit
    end
  end
  
  def destroy
    if ProviderDetail.find(params[:id]).destroy
      redirect_to user_path(current_user), notice: 'your address was successfully destroyed.' 
    end
  end

  private

  def set_provider_details
    @provider_detail = ProviderDetail.find(params[:id])
  end

  def check_provider
    unless @provider_detail.provider.user_id == current_user.id
      redirect_to root_path
    end
  end
  
  def invalid_provider_details
    redirect_to '/'
  end

  def provider_detail_params
    params.require(:provider_detail).permit(:city, :state, :zipcode, :description, :category_id)
  end

  # def is_provider?
  #   @provider = Provider.find_by(user_id: current_user.id)
  #   if @provider
  #     session[:provider_id]= @provider.id
  #   else
  #     @provider = Provider.create(user_id: current_user.id)
  #     session[:provider_id]= @provider.id
  #   end
  # end

end
