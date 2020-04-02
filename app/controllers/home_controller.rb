class HomeController < ApplicationController
   
  before_action :authenticate_user!

  def index
    @provider_details = ProviderDetail.all
    @categories= Category.all
  end

  def find_provider_for_city
    category_id = Category.find_by(name: params[:search_input].capitalize)
    @provider_details= ProviderDetail.where(category_id: category_id.id, city: params[:city])
  end

  def find_provider_by_category
    category_id = Category.find(params[:format])
    @provider_details= ProviderDetail.where(category_id: category_id.id)
  end
  
end
