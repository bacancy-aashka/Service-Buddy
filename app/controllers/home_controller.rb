class HomeController < ApplicationController
   
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  # def user_page 
  #   @user = current_user
  # end

end
