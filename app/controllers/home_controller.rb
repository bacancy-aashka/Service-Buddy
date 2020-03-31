class HomeController < ApplicationController
   
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def msg
    # respond_to do |format|
    #   format.js {}
    # end
    # respond_to :js
    # msg_path(format: :js)
  end
  # def user_page 
  #   @user = current_user
  # end

end
