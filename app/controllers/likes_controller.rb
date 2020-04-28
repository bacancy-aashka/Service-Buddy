class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.comment_id = params[:comment_id]
    @like.user_id = current_user.id
    if @like.save
      @provider_detail= ProviderDetail.find(params[:provider_detail_id])
    else
      redirect_to provider_detail_path(params[:provider_detail_id]), notice: 'Like Failed.'
    end
    # provider_detail_path(params[:provider_id])
    # byebug
  end

  def delete
    @like = Like.find_by(comment_id: params[:comment_id], user_id: current_user)
    if @like.destroy
      @provider_detail= ProviderDetail.find(params[:provider_detail_id])
    else
      redirect_to provider_detail_path(params[:provider_detail_id]), notice: 'Dis Like Failed'
    end
  end
end
