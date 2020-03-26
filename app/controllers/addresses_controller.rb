class AddressesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_address, only: %i[edit update destroy]
  before_action :check_address, only: %i[edit]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @user = User.find(current_user.id)
    if @address.save
      redirect_to user_path(@user), notice: 'Your adderess successfully added to your profile.' 
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(current_user), notice: 'Your adderess is successfully edited.' 
    else
      render :edit
    end
  end
  
  def destroy
    @address.destroy
    redirect_to user_path(current_user), notice: 'your address was successfully destroyed.' 
  end


  private

  def set_address
    @address = Address.find(params[:id])
  end

  def check_address
    unless @address.user_id == current_user.id
      redirect_to root_path
    end
  end

  def address_params
    params.require(:address).permit(:location, :city, :state, :zipcode)
  end

end
