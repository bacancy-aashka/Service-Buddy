class CategoriesController < ApplicationController

  before_action :authenticate_user! 
  before_action :check_user
  before_action :set_category, only: %i[edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_category

  def index
    @category = Category.ransack(params[:q])
    @categories_result = @category.result(distinct: true).paginate(per_page: 5, page: params[:page])
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: 'Category is successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: 'Category was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.' 
  end

  private

  def check_user
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def invalid_category
    # logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to '/', notice: "Invalid category"
  end

end


