class CommentsController < ApplicationController
   
  before_action :authenticate_user!

  def create
    @provider_detail = ProviderDetail.find(params[:provider_detail_id])
    @comment = @provider_detail.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    # ActionCable.server.broadcast "comment_channel", { comment: (render partial: "comments/comment", locals: { comment: @comment }) }   
    redirect_to provider_detail_path(@provider_detail)
  end

  def destroy
    @provider_detail = ProviderDetail.find(params[:provider_detail_id])
    @comment = @provider_detail.comments.find(params[:id])
    @comment.destroy
    redirect_to provider_detail_path(@provider_detail)
  end
 
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
