class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: %i[show]
  before_action :check_user, only: %i[show]

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    unless current_user == @user
      redirect_to root_path
    end
  end

end
