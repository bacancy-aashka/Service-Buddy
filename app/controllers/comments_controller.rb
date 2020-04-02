class CommentsController < ApplicationController
   
  before_action :authenticate_user!

  def create
    @comment = Comment.create(comment_params)
    @comment.save
    ActionCable.server.broadcast "comment_channel", { comment: @comment }   
    redirect_to user_path(@comment.provider.user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @provider = @comment.provider.user
    @comment.destroy
    redirect_to user_path(@provider)
  end
 
  private

  def comment_params
    params.require(:comment).permit(:body, :provider_id, :user_id)
  end

end
