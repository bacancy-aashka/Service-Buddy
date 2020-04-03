class HomeController < ApplicationController
   
  before_action :authenticate_user!

  def index
    @provider_details = ProviderDetail.all
    @categories= Category.all
  end

  def msg
    @conversation = Conversation.get(current_user.id, params[:user_id])

    add_to_conversations
  end

  def find_provider_by_category
    category_id = Category.find(params[:format])
    @provider_details= ProviderDetail.where(category_id: category_id.id)
  end
  
  def find_provider_for_city
    category_id = Category.find_by(name: params[:search_input].capitalize)
    @provider_details= ProviderDetail.where(category_id: category_id.id, city: params[:city])
  end


  private

  def add_to_conversations
    session[:conversations] = @conversation.id
  end

  
end
