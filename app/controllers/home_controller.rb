class HomeController < ApplicationController
   
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def msg
    @conversation = Conversation.get(current_user.id, params[:user_id])

    add_to_conversations
  end
  # def user_page 
  #   @user = current_user
  # end


  private

  def add_to_conversations
    session[:conversations] = @conversation.id
  end


end
